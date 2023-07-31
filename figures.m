%% Plot Model 1 phase diagrams

load('data_model1.mat')

figure(1)

clf

phasePlot(b,a,nPeaks_ab_model1,nZero_ab_model1,'$b$','$a$','linear','linear')

figure(2)

clf

phasePlot(d,c,nPeaks_cd_model1,nZero_cd_model1,'$d$','$c$','linear','linear')

figure(3)

clf

phasePlot(b,a,nPeaks_ab_vD_model1,nZero_ab_vD_model1,'$b$','$a$','linear','linear')

figure(4)

clf

phasePlot(DI,DA,nPeaks_DADI_model1,nZero_DADI_model1,'$D_I$','$D_A$')


%% Plot Model 2 phase diagrams

load('data_model2.mat')

figure(4)

clf

phasePlot(b,a,nPeaks_ab_model2,nZero_ab_model2,'$b$','$a$','linear','linear')

figure(5)

clf

phasePlot(d,c,nPeaks_cd_model2,nZero_cd_model2,'$d$','$c$','linear','linear')

figure(6)

clf

phasePlot(b,a,nPeaks_ab_vD_model2,nZero_ab_vD_model2,'$b$','$a$','linear','linear')

figure(7)

clf

phasePlot(DI,DA,nPeaks_DADI_model2,nZero_DADI_model2,'$D_I$','$D_A$')

%% Plot Model 1 main result

load('data_main.mat')

ymaxA = 20;
ymaxI = 10;

figure(1)
clf
subplot(2,2,1)
title('$t=0$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_1_main(:,1),I_1_main(:,1),ymaxA,ymaxI)

subplot(2,2,2)
title('$t=0.01$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_1_main(:,2),I_1_main(:,2),ymaxA,ymaxI)

subplot(2,2,3)
title('$t=0.05$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_1_main(:,6),I_1_main(:,6),ymaxA,ymaxI)

subplot(2,2,4)
title('$t=0.25$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_1_main(:,26),I_1_main(:,26),ymaxA,ymaxI)


%% Plot Model 1 overexpression

load('data_main.mat')

ymaxA = 30;
ymaxI = 15;

figure(2)
clf
subplot(2,2,1)
title('$t=0$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_1_doublePlk4(:,1),I_1_doublePlk4(:,1),ymaxA,ymaxI)

subplot(2,2,2)
title('$t=0.01$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_1_doublePlk4(:,2),I_1_doublePlk4(:,2),ymaxA,ymaxI)

subplot(2,2,3)
title('$t=0.05$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_1_doublePlk4(:,6),I_1_doublePlk4(:,6),ymaxA,ymaxI)

subplot(2,2,4)
title('$t=0.25$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_1_doublePlk4(:,26),I_1_doublePlk4(:,26),ymaxA,ymaxI)

%% Plot Model 1 kinase inhibition

load('data_main.mat')

ymaxA = 150;
ymaxI = 150;

figure(3)
clf
subplot(2,2,1)
title('$t=0$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_1_inhibitKinase(:,1),I_1_inhibitKinase(:,1),ymaxA,ymaxI)

subplot(2,2,2)
title('$t=0.01$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_1_inhibitKinase(:,10),I_1_inhibitKinase(:,10),ymaxA,ymaxI)

subplot(2,2,3)
title('$t=0.25$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_1_inhibitKinase(:,26),I_1_inhibitKinase(:,26),ymaxA,ymaxI)

subplot(2,2,4)
title('$t=1$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_1_inhibitKinase(:,100),I_1_inhibitKinase(:,100),ymaxA,ymaxI)


%% Plot Model 2 main result

load('data_main.mat')

ymaxA = 15;
ymaxI = 0.5;

figure(1)

clf

subplot(2,2,1)
title('$t=0$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_2_main(:,1),I_2_main(:,1),ymaxA,ymaxI)

subplot(2,2,2)
title('$t=0.01$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_2_main(:,2),I_2_main(:,2),ymaxA,ymaxI)

subplot(2,2,3)
title('$t=0.05$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_2_main(:,6),I_2_main(:,6),ymaxA,ymaxI)

subplot(2,2,4)
title('$t=0.25$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_2_main(:,26),I_2_main(:,26),ymaxA,ymaxI)

%% Plot Model 2 overexpression

load('data_main.mat')

ymaxA = 15;
ymaxI = 0.5;

figure(2)

clf

subplot(2,2,1)
title('$t=0$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_2_doublePlk4(:,1),I_2_doublePlk4(:,1),ymaxA,ymaxI)

subplot(2,2,2)
title('$t=0.01$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_2_doublePlk4(:,2),I_2_doublePlk4(:,2),ymaxA,ymaxI)

subplot(2,2,3)
title('$t=0.05$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_2_doublePlk4(:,6),I_2_doublePlk4(:,6),ymaxA,ymaxI)

subplot(2,2,4)
title('$t=0.25$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_2_doublePlk4(:,26),I_2_doublePlk4(:,26),ymaxA,ymaxI)


%% Plot Model 2 kinase inhibition

load('data_main.mat')

ymaxA = 5;
ymaxI = 5;

figure(3)

clf

subplot(2,2,1)
title('$t=0$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_2_inhibitKinase(:,1),I_2_inhibitKinase(:,1),ymaxA,ymaxI)

subplot(2,2,2)
title('$t=0.01$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_2_inhibitKinase(:,2),I_2_inhibitKinase(:,2),ymaxA,ymaxI)

subplot(2,2,3)
title('$t=0.05$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_2_inhibitKinase(:,6),I_2_inhibitKinase(:,6),ymaxA,ymaxI)

subplot(2,2,4)
title('$t=0.25$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotAI(A_2_inhibitKinase(:,26),I_2_inhibitKinase(:,26),ymaxA,ymaxI)

%% Plot Model 1 9-fold discrete ring

load('data_discrete.mat')

M = model1_discrete{8};

f = figure(1);

f.Position = [20 300 1400 300];

clf

subplot(1,4,1)
title('$t=0$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotRing(M(:,1))

subplot(1,4,2)
title('$t=0.05$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotRing(M(:,6))

subplot(1,4,3)
title('$t=0.1$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotRing(M(:,11))

subplot(1,4,4)
title('$t=0.2$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotRing(M(:,21))

%% Plot Model 2 9-fold discrete ring

load('data_discrete.mat')

M = model2_discrete{8};

f = figure(2);

f.Position = [20 300 1400 300];

clf

subplot(1,4,1)
title('$t=0$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotRing(M(:,1))

subplot(1,4,2)
title('$t=0.05$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotRing(M(:,6))

subplot(1,4,3)
title('$t=0.1$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotRing(M(:,11))

subplot(1,4,4)
title('$t=0.2$','FontWeight','Normal','interpreter','latex','fontsize',12)
plotRing(M(:,21))

%% Plot Model 1 discrete ring for 2-10 compartments

load('data_discrete.mat')

f = figure(3);

f.Position = [20 20 800 800];

clf

for i = 1:9

M = model1_discrete{i};

subplot(3,3,i)
title(num2str(i + 1),'FontWeight','Normal','interpreter','latex','fontsize',12)
plotRing(M(:,end),50)

end

%% Plot Model 2 discrete ring for 2-10 compartments

load('data_discrete.mat')

f = figure(4);

f.Position = [20 20 800 800];

clf

for i = 1:9

M = model2_discrete{i};

subplot(3,3,i)
title(num2str(i + 1),'FontWeight','Normal','interpreter','latex','fontsize',12)
plotRing(M(:,end),50)

end