%% Model 1 simulations

rng('default');

a = 500;
b = 250;
c = 0;
d = 400;

DA = 2;
DI = 5000;

nx = 50;

[A_1_main,I_1_main] = solveModel1(a,b,c,d,DA,DI,nx);
[A_1_doublePlk4,I_1_doublePlk4] = solveModel1(2*a,b,c,d,DA,DI,nx);
[A_1_inhibitKinase,I_1_inhibitKinase] = solveModel1(a,0.2*b,c,d,DA,DI,nx);

% save('data_main.mat','A_1_main','I_1_main','A_1_doublePlk4','I_1_doublePlk4','A_1_inhibitKinase','I_1_inhibitKinase')


%% Model 2 simulations

% rng('default');

a = 100;
b = 150;
c = 60;
d = 60;

DA = 2;
DI = 5000;

nx = 50;

[A_2_main,I_2_main] = solveModel2(a,b,c,d,DA,DI,nx);
[A_2_doublePlk4,I_2_doublePlk4] = solveModel2(2*a,b,c,d,DA,DI,nx);
[A_2_inhibitKinase,I_2_inhibitKinase] = solveModel2(a,0.25*b,c,d,DA,DI,nx);

% save('data_main.mat','A_2_main','I_2_main','A_2_doublePlk4','I_2_doublePlk4','A_2_inhibitKinase','I_2_inhibitKinase','-append')

%% Model 1 - a,b sweep plot

c = 0;
d = 400;

DA = 2;
DI = 5000;

nx = 50;

a = 0:15:1500;
b = 0:3:300;

numSim = 20;

na = length(a);
nb = length(b);

nPeaks_ab_model1 = zeros(na,nb,numSim);
nZero_ab_model1  = zeros(na,nb,numSim);

nZero_ab_model1(1,:,:) = 1;

parfor k = 1:numSim
    
    for i = 2:na % We don't simulate a=1 or b=1 due to matrix singularity.
                 % These results can be shown analytically
        for j = 2:nb
            
            [A,~,~,~] = solveModel1(a(i),b(j),c,d,DA,DI,nx,5,0);
            
            [nPeaks,nZero] = numpeaks(A,0.5);
            
            nPeaks_ab_model1(i,j,k)   = nPeaks;
            nZero_ab_model1(i,j,k) = nZero;
            
        end
    end
end

figure(1)

clf

phasePlot(b,a,nPeaks_ab_model1,nZero_ab_model1,'$b$','$a$','linear','linear')

% save('data_model1.mat','nPeaks_ab_model1','nZero_ab_model1','a','b')

%% Model 1 - c,d sweep plot

a = 500;
b = 250;

DA = 2;
DI = 5000;

nx = 50;

c = 0:1.5:150;
d = 0:7.5:750;

numSim = 20;

nc = length(c);
nd = length(d);

nPeaks_cd_model1 = zeros(nc,nd,numSim);
nZero_cd_model1  = zeros(nc,nd,numSim);

for k = 1:numSim
   
    for i = 1:nc 
        
        for j = 1:nd 
            
            [A,I,~,~] = solveModel1(a,b,c(i),d(j),DA,DI,nx,5,0);
            
            [nPeaks,nZero] = numpeaks(A+I,0.5);
            
            nPeaks_cd_model1(i,j,k) = nPeaks;
            nZero_cd_model1(i,j,k)  = nZero;
            
        end
    end
end

figure(1)

clf

phasePlot(d,c,nPeaks_cd_model1,nZero_cd_model1,'$d$','$c$','linear','linear')

% save('data_model1.mat','nPeaks_cd_model1','nZero_cd_model1','c','d','-append')

%% Model 1 - a,b sweep plot - variable diffusion

a0 = 500;
c  = 0;
d  = 400;

DA = 2;
DI = 5000;

nx = 50;

a = 0:15:1500;
b = 0:3:300;

numSim = 20;

na = length(a);
nb = length(b);

nPeaks_ab_vD_model1 = zeros(na,nb,numSim);
nZero_ab_vD_model1  = zeros(na,nb,numSim);

nZero_ab_vD_model1(1,:,:) = 1;

parfor k = 1:numSim
    
    for i = 2:na % We don't simulate a=1 or b=1 due to matrix singularity.
                 % These results can be shown analytically
        for j = 2:nb 
            
            [A,~,~,~] = solveModel1(a(i),b(j),c,d,DA*a0/a(i),DI*a0/a(i),nx,5,0);
            
            [nPeaks,nZero] = numpeaks(A,0.5);
            
            nPeaks_ab_vD_model1(i,j,k) = nPeaks;
            nZero_ab_vD_model1(i,j,k)  = nZero;
            
        end
    end
end

figure(3)

clf

phasePlot(b,a,nPeaks_ab_vD_model1,nZero_ab_vD_model1,'$b$','$a$','linear','linear')

% save('data_model1.mat','nPeaks_ab_vD_model1','nZero_ab_vD_model1','-append')

%% Model 1 - DA,DI sweep plot

a = 500;
b = 250;
c = 0;
d = 400;

nx = 50;

p = -2:0.02:0;

DA = 100*10.^(p);
DI = 5000*10.^(p);

nA = length(DA);
nI = length(DI);

numSim = 20;

nPeaks_DADI_model1 = zeros(nA,nI,numSim);
nZero_DADI_model1  = zeros(nA,nI,numSim);

parfor k = 1:numSim
 
    for i = 1:nA
        
        for j = 1:nI
            
            [A,~,~,~] = solveModel1(a,b,c,d,DA(i),DI(j),nx,10,0);
            
            [nPeaks,nZero] = numpeaks(A,0.9);
            
            nPeaks_DADI_model1(i,j,k)   = nPeaks;
            nZero_DADI_model1(i,j,k) = nZero;
            
        end
        
    end
    
end

figure(3)

clf

phasePlot(DI,DA,nPeaks_DADI_model1,nZero_DADI_model1,'$D_I$','$D_A$','log','log')

% save('data_model1.mat','nPeaks_DADI_model1','nZero_DADI_model1','DA','DI','-append')

%% Model 2 - a,b sweep plot

c = 60;
d = 60;

DA = 2;
DI = 5000;

nx = 50;

a = 0:3.5:350; % 0:2:250;
b = 0:10:1000; % 0:5:500;

numSim = 20;

na = length(a);
nb = length(b);

nPeaks_ab_model2 = zeros(na,nb,numSim);
nZero_ab_model2  = zeros(na,nb,numSim);

parfor k = 1:numSim

    for i = 2:na
        
        for j = 2:nb
            
            [A,I,Ainit,~] = solveModel2(a(i),b(j),c,d,DA,DI,nx,10,0);
            
            A = A(:,end);

            [nPeaks,nZero] = numpeaks(A + I,0.99);
            
            nPeaks_ab_model2(i,j,k) = nPeaks;
            nZero_ab_model2(i,j,k)  = nZero;
            
        end
    end
end

figure(4)

clf

phasePlot(b,a,nPeaks_ab_model2,nZero_ab_model2,'$b$','$a$','linear','linear')

% save('data_model2.mat','nPeaks_ab_model2','nZero_ab_model2','a','b')

%% Model 2 - c,d sweep plot

a = 100;
b = 150;

DA = 2;
DI = 5000;

nx = 50;

c = 0:1:100;
d = 0:1:100;

numSim = 20;

nc = length(c);
nd = length(d);

nPeaks_cd_model2 = zeros(nc,nd,numSim);
nZero_cd_model2  = zeros(nc,nd,numSim);

parfor k = 1:numSim
    
    for i = 2:nc

        for j = 1:nd
            
            [A,~,I,~] = solveModel2(a,b,c(i),d(j),DA,DI,nx,5,0);
            
            [nPeaks,nZero] = numpeaks(A+I,0.5);
            
            nPeaks_cd_model2(i,j,k) = nPeaks;
            nZero_cd_model2(i,j,k)  = nZero;
            
        end
    end
end

figure(1)

clf

phasePlot(d,c,nPeaks_cd_model2,nZero_cd_model2,'$d$','$c$','linear','linear')

% save('data_model2.mat','nPeaks_cd_model2','nZero_cd_model2','c','d','-append')

%% Model 2 - a,b sweep plot - variable Diffusion

a0 = 100;
b0 = 150;
c  = 60;
d  = 60;

DA = 2;
DI = 5000;

nx = 50;

a = 0:3.5:350; % 0:2:250;
b = 0:10:1000; % 0:5:500;

numSim = 20;

na = length(a);
nb = length(b);

nPeaks_ab_vD_model2 = zeros(na,nb,numSim);
nZero_ab_vD_model2  = zeros(na,nb,numSim);

parfor k = 1:numSim

    for i = 2:na
        
        for j = 2:nb
            
            [A,I,Ainit,~] = solveModel2(a(i),b(j),c,d,DA*a0/a(i),DI*a0/a(i),nx,10,0);
            
            A = A(:,end);

            [nPeaks,nZero] = numpeaks(A + I,0.9);
            
            nPeaks_ab_vD_model2(i,j,k) = nPeaks;
            nZero_ab_vD_model2(i,j,k)  = nZero;
            
        end
    end
end

figure(5)

clf

phasePlot(b,a,nPeaks_ab_vD_model2,nZero_ab_vD_model2,'$b$','$a$','linear','linear')

% save('data_model2.mat','nPeaks_ab_vD_model2','nZero_ab_vD_model2','-append')

%% Model 2 - DA,DI sweep plot

a = 100;
b = 150;
c = 60;
d = 60;

nx   = 50;
tmax = 1;

p = -2:0.02:0;

DA = 100*10.^(p);
DI = 5000*10.^(p);

nA = length(DA);
nI = length(DI);

numSim = 20;

nPeaks_DADI_model2 = zeros(nA,nI,numSim);
nZero_DADI_model2  = zeros(nA,nI,numSim);

parfor k = 1:numSim

    for i = 1:nA
        
        for j = 1:nI

            [A,~,~,~] = solveModel2(a,b,c,d,DA(i),DI(j),nx,10,0);
            
            [nPeaks,nZero] = numpeaks(A,0.5);
            
            nPeaks_DADI_model2(i,j,k) = nPeaks;
            nZero_DADI_model2(i,j,k)  = nZero;
            
        end
    end
end

figure(6)

clf

phasePlot(DI,DA,nPeaks_DADI_model2,nZero_DADI_model2,'$D_I$','$D_A$','log','log')

% save('data_model2.mat','nPeaks_DADI_model2','nZero_DADI_model2','DA','DI','-append')


%% Model 1 discrete

rng('default');

a = 250;
b = 250;
c = 0;
d = 400;

DA = 2;
DI = 5000;

model1_discrete = cell(9,1);

for i = 1:9

    nx = i+1;
    
    [A,I] = solveModel1(a,b,c,d,DA,DI,nx,10);
    
    model1_discrete{i} = A+I;

end

% save('data_discrete.mat','model1_discrete')

%% Model 2 discrete

rng('default');

a = 100;
b = 150;
c = 60;
d = 60;

DA = 2;
DI = 5000;

model2_discrete = cell(9,1);

for i = 1:9

    nx = i+1;
    
    [A,I] = solveModel2(a,b,c,d,DA,DI,nx,10);
    
    model2_discrete{i} = A+I;

end

% save('data_discrete.mat','model2_discrete','-append')