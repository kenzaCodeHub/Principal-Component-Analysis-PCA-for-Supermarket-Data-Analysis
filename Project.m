%load the dataset of the market
Dataset=load('supermarche.txt');
%Display the dataset
disp(Dataset);
%Data size
size(Dataset);
%Center the data
Data_centered=Dataset-mean(Dataset);
disp(Data_centered);
%Normalise the data
Data_Normlized=Data_centered./std(Dataset,0,1);
disp(Data_Normlized);
%Calculate the correlation matrix
Cov_matrix = (1 / (size(Data_Normlized, 1) - 1)) * (Data_Normlized' * Data_Normlized);
disp(Cov_matrix);
% Calcul des valeurs propres et des vecteurs propres
[E, D] = eig(Cov_matrix);
% Display results
disp('Vecteurs propres (E):');
disp(E);
disp('Valeurs propres (D):');
disp(diag(D));
% Projection of data onto the first two principal components
New_data = Data_Normlized * E;
%Plot the results
figure;
plot(New_data(:, 1), New_data(:, 2), '*');
title('Projection des données sur les deux premières composantes principales');
xlabel('Composante principale 1');
ylabel('Composante principale 2');
%Add The new dataset d'amiens
amiens=[4.5,1.3,4.0,3.9,4.9];
%Center the amiens data
Data_amiens = amiens - mean(Dataset); 
disp(Data_amiens);
%Normalise the amiens data
Data_Normlized_amiens = Data_amiens ./ std(Dataset, 0, 1); 
disp(Data_Normlized_amiens);
%Projection of new data onto the first two principal components
New_data_amiens = Data_Normlized_amiens * E;
disp(New_data_amiens)
%Plot the results
figure;
plot(New_data(:, 1), New_data(:, 2), '*b'); 
hold on;
plot(New_data_amiens(1), New_data_amiens(2), 'ro', 'MarkerSize', 7, 'LineWidth', 3); 
title('Projection des données sur les deux premières composantes principales');
xlabel('Composante principale 1');
ylabel('Composante principale 2');
grid on;
legend('Données', 'Amiens');
hold off;