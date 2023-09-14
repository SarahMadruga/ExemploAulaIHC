clear all
close all
clc

%% Dados
identUsuarios = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
noDeUsosAjuda = [2,5,4,8,1,0,0,3,5,1,2,0,6,2,0];
% 0 indica um usuário profissional, e 1 um usuário amador
categoriaUsuario = [0,1,0,1,0,0,0,1,1,0,0,0,1,0,0];

%% Comprimento dos vetores de dados brutos
dataLength = length(identUsuarios);
dataLengthAmador = nnz(categoriaUsuario);
dataLengthProf = dataLength - dataLengthAmador;

%% Separação das categorias de usuários
indexAmador = 0;
indexProf = 0;
for k = 1:1:dataLength
        if(categoriaUsuario(k)==1)
            indexAmador = indexAmador+1;
            noDeUsosAmador(indexAmador) = noDeUsosAjuda(k);
            usuarioAmadorIdent(indexAmador) = identUsuarios(k);
        else
            indexProf = indexProf+1;
            noDeUsosProf(indexProf) = noDeUsosAjuda(k);
            usuarioProfIdent(indexProf) = identUsuarios(k);
        end
end

%% Cálculo das métricas estatísticas
% Médias
mediaUsosAmador = mean(noDeUsosAmador);
mediaUsosProf = mean(noDeUsosProf);

% Medianas
medianaUsosAmador = median(noDeUsosAmador);
medianaUsosProf = median(noDeUsosProf);


%% Categorização
noDeUsuarios = categorical({'Total' 'Amadores' 'Profissionais'});

%% Plots
figure(1)
subplot(2,1,1),
hold on
grid on
plot(usuarioAmadorIdent,noDeUsosAmador,'ko','LineWidth',1.5)
plot(usuarioAmadorIdent,mediaUsosAmador*ones(dataLengthAmador,1),'--r','LineWidth',1.5)
plot(usuarioAmadorIdent,medianaUsosAmador*ones(dataLengthAmador,1),'--b','LineWidth',1.5)
xlabel('Identificação do usuário')
ylabel('Número de usos')
title('Usuários amadores')
legend('Dado bruto','Média','Mediana')
xlim([min(usuarioAmadorIdent) max(usuarioAmadorIdent)]);
ylim([0 10]);
subplot(2,1,2),
hold on
grid on
plot(usuarioProfIdent,noDeUsosProf,'ko','LineWidth',1.5)
plot(usuarioProfIdent,mediaUsosProf*ones(dataLengthProf,1),'--r','LineWidth',1.5)
plot(usuarioProfIdent,medianaUsosProf*ones(dataLengthProf,1),'--b','LineWidth',1.5)
xlabel('Identificação do usuário')
ylabel('Número de usos')
title('Usuários profissionais')
legend('Dado bruto','Média','Mediana')
xlim([min(usuarioProfIdent) max(usuarioProfIdent)]);
ylim([0 10]);


figure(2)
subplot(2,1,1),
hold on
grid on
p1 = bar(noDeUsuarios,[100*dataLength/dataLength 100*dataLengthAmador/dataLength 100*dataLengthProf/dataLength]);
ylabel('Distribuição dos usuários (%)')
set(p1,'FaceColor','red');
subplot(2,1,2),
hold on
grid on
p2 = bar(noDeUsuarios,[100*sum(noDeUsosAjuda)/sum(noDeUsosAjuda) 100*sum(noDeUsosAmador)/sum(noDeUsosAjuda) 100*sum(noDeUsosProf)/sum(noDeUsosAjuda)]);
ylabel('Número usos da ajuda (%)')
set(p2,'FaceColor','blue');