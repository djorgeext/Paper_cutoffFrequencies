sp0_05 = load('sp513_0__0.5.txt');
sp05_15 = load('sp513_0.5__1.5.txt');
sp15_208 = load('sp513_1.5__2.08.txt');
sp208_45 = load('sp513_2.08__4.5.txt');
sp7_10 = load('sp513_7__10.txt');
r0_prom = load('r0_prom.txt');
f = linspace(0,0.5,513)';
y1 = 100 * f.^(-1.9);
y2 = 80000 * f.^(-1);

sp11_14 = load('sp513_11__14.txt');
sp15_24 = load('sp513_15__24.txt');
sp26_34 = load('sp513_26__34.txt');
sp35_45 = load('sp513_35__45.txt');
sp70_74 = load('sp513_70__74.txt');



figure (1), loglog(f(3:end), sp11_14(3:end), 'b', 'LineWidth', 6);
hold on
loglog(f(3:end), sp15_24(3:end), 'c', 'LineWidth',6)
loglog(f(3:end), sp26_34(3:end), 'm', 'LineWidth',6)
loglog(f(3:end), sp35_45(3:end), 'g', 'LineWidth',6)
loglog(f(3:end), sp70_74(3:end), 'r', 'LineWidth',6)
loglog(f(3:end), sp0_05(3:end), 'k', 'LineWidth',6)

ylabel('$\mathrm{S(f)}$', 'Interpreter','latex');
xlabel('$\mathrm{f}$', 'Interpreter', 'latex');
set(gca, 'FontSize', 42);
set(gca, 'LineWidth', 4);
xlim([0.0017 0.6])
ylim([1000 4*10^8])
yticks([10^4 10^6 10^8])
xticks([0.01 0.1 0.5])


figure (2), loglog(f(3:end), sp0_05(3:end), 'b', 'LineWidth', 6);
hold on
loglog(f(3:end), sp05_15(3:end), 'c', 'LineWidth',6)
loglog(f(3:end), sp15_208(3:end), 'm', 'LineWidth',6)
loglog(f(3:end), sp208_45(3:end), 'g', 'LineWidth',6)
loglog(f(3:end), sp7_10(3:end), 'r', 'LineWidth',6)
loglog(f(3:end), r0_prom, 'k', 'LineWidth',6)

ylabel('$\mathrm{S(f)}$', 'Interpreter','latex');
xlabel('$\mathrm{f}$', 'Interpreter', 'latex');
set(gca, 'FontSize', 42);
set(gca, 'LineWidth', 4);
xlim([0.0017 0.6])
ylim([1000 4*10^8])
yticks([10^4 10^6 10^8])
xticks([0.01 0.1 0.5])