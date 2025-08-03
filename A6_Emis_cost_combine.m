clc;
clear;
% This code is used to merge the agricultural emissions and production data from all scenarios.
for YSSP=2
    for Mo_EC=1:3 % 1 is the min,2 is the mean, 3 is the max
        
       
        % % % Co_figdata=zeros(2836,7,61,18);
        for Fsce=1:7
            display(Fsce)
%             for yr=11:61
            for yr=61
                if Fsce==1 % no urban
                    load(strcat('output\Result_sce\Sce_1_noSSP\EC_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_1_noSSP\Cost_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_1_noSSP\Emis_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                elseif Fsce==2 % SSP1 urban
                    load(strcat('output\Result_sce\Sce_1_SSP1\EC_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_1_SSP1\Cost_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_1_SSP1\Emis_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                elseif Fsce==3 % SSP2 urban
                    load(strcat('output\Result_sce\Sce_1_SSP2\EC_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_1_SSP2\Cost_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_1_SSP2\Emis_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                elseif Fsce==4 % SSP3 urban
                    load(strcat('output\Result_sce\Sce_1_SSP3\EC_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_1_SSP3\Cost_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_1_SSP3\Emis_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                elseif Fsce==5 % SSP4 urban
                    load(strcat('output\Result_sce\Sce_1_SSP4\EC_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_1_SSP4\Cost_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_1_SSP4\Emis_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                elseif Fsce>=6 % SSP5 urban
                    load(strcat('output\Result_sce\Sce_1_SSP5\EC_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_1_SSP5\Cost_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_1_SSP5\Emis_Farm_cur','-',num2str(YSSP),'-',num2str(1),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                end
                EC_Farm=EC_Farm_cur;
                EC_Farm(isnan(EC_Farm)) =0;
                Cost_Farm=Cost_Farm_cur;
                Cost_Farm(isnan(Cost_Farm)) =0;
                Emis_Farm=Emis_Farm_cur;
                Emis_Farm(isnan(Emis_Farm)) =0;
                
                for co=1:2836
                    Co_figdata(co,1,yr,Fsce)=EC_Farm(co,2); % Acrop (ha)
                    Co_figdata(co,2,yr,Fsce)=EC_Farm(co,4); % crop production (t)
                    Co_figdata(co,3,yr,Fsce)=EC_Farm(co,8); % water (m3)
                    Co_figdata(co,4,yr,Fsce)=EC_Farm(co,9); % Nfer (kg N)
                    Co_figdata(co,5,yr,Fsce)=EC_Farm(co,5); % crop cost ($)
                    Co_figdata(co,6,yr,Fsce)=EC_Farm(co,6); % crop emis (t CO₂e)
                    Co_figdata(co,7,yr,Fsce)=0; % Occupied forest area by large-scale farming (ha)
                    Co_figdata(co,8,yr,Fsce)=EC_Farm(co,7);% crop residue (t)
                    Co_figdata(co,9,yr,Fsce)=0; % Occupied forest + grassland area by large-scale farming (ha)
                    
                    Co_figdata(co,10,yr,Fsce)=Cost_Farm(co,1); % Pro_mai
                    Co_figdata(co,11,yr,Fsce)=Cost_Farm(co,2); % Pro_ric
                    Co_figdata(co,12,yr,Fsce)=Cost_Farm(co,3); % Pro_whe
                    Co_figdata(co,13,yr,Fsce)=Cost_Farm(co,4); % Pro_soy
                    Co_figdata(co,14,yr,Fsce)=Cost_Farm(co,5); % Cost_mai_conv
                    Co_figdata(co,15,yr,Fsce)=Cost_Farm(co,6); % Cost_ric_conv
                    Co_figdata(co,16,yr,Fsce)=Cost_Farm(co,7); % Cost_whe_conv
                    Co_figdata(co,17,yr,Fsce)=Cost_Farm(co,8); % Cost_soy_conv
                    Co_figdata(co,18,yr,Fsce)=Cost_Farm(co,9); % Cost_mai_mach
                    Co_figdata(co,19,yr,Fsce)=Cost_Farm(co,10); % Cost_ric_mach
                    Co_figdata(co,20,yr,Fsce)=Cost_Farm(co,11); % Cost_whe_mach
                    Co_figdata(co,21,yr,Fsce)=Cost_Farm(co,12); % Cost_soy_mach
                    Co_figdata(co,22,yr,Fsce)=Cost_Farm(co,13); % Cost_mai_labor
                    Co_figdata(co,23,yr,Fsce)=Cost_Farm(co,14); % Cost_ric_labor
                    Co_figdata(co,24,yr,Fsce)=Cost_Farm(co,15); % Cost_whe_labor
                    Co_figdata(co,25,yr,Fsce)=Cost_Farm(co,16); % Cost_soy_labor
                    Co_figdata(co,26,yr,Fsce)=Cost_Farm(co,17); % Cost_mai_Nfer
                    Co_figdata(co,27,yr,Fsce)=Cost_Farm(co,18); % Cost_ric_Nfer
                    Co_figdata(co,28,yr,Fsce)=Cost_Farm(co,19); % Cost_whe_Nfer
                    Co_figdata(co,29,yr,Fsce)=Cost_Farm(co,20); % Cost_soy_Nfer
                    Co_figdata(co,30,yr,Fsce)=Cost_Farm(co,21); % Cost_mai_water
                    Co_figdata(co,31,yr,Fsce)=Cost_Farm(co,22); % Cost_ric_water
                    Co_figdata(co,32,yr,Fsce)=Cost_Farm(co,23); % Cost_whe_water
                    Co_figdata(co,33,yr,Fsce)=Cost_Farm(co,24); % Cost_soy_water
                    Co_figdata(co,34,yr,Fsce)=Cost_Farm(co,25); % Cost_mai_seed
                    Co_figdata(co,35,yr,Fsce)=Cost_Farm(co,26); % Cost_ric_seed
                    Co_figdata(co,36,yr,Fsce)=Cost_Farm(co,27); % Cost_whe_seed
                    Co_figdata(co,37,yr,Fsce)=Cost_Farm(co,28); % Cost_soy_seed
                    Co_figdata(co,38,yr,Fsce)=Cost_Farm(co,29); % Cost_mai_land
                    Co_figdata(co,39,yr,Fsce)=Cost_Farm(co,30); % Cost_ric_land
                    Co_figdata(co,40,yr,Fsce)=Cost_Farm(co,31); % Cost_whe_land
                    Co_figdata(co,41,yr,Fsce)=Cost_Farm(co,32); % Cost_soy_land
                    Co_figdata(co,42,yr,Fsce)=Cost_Farm(co,33); % Cost_mai_other
                    Co_figdata(co,43,yr,Fsce)=Cost_Farm(co,34); % Cost_ric_other
                    Co_figdata(co,44,yr,Fsce)=Cost_Farm(co,35); % Cost_whe_other
                    Co_figdata(co,45,yr,Fsce)=Cost_Farm(co,36); % Cost_soy_other
                    
                    Co_figdata(co,46,yr,Fsce)=Emis_Farm(co,1); % Emis_mai_ELUC
                    Co_figdata(co,47,yr,Fsce)=Emis_Farm(co,2); % Emis_ric_ELUC
                    Co_figdata(co,48,yr,Fsce)=Emis_Farm(co,3); % Emis_whe_ELUC
                    Co_figdata(co,49,yr,Fsce)=Emis_Farm(co,4); % Emis_soy_ELUC
                    Co_figdata(co,50,yr,Fsce)=Emis_Farm(co,5); % Emis_mai_ferpro
                    Co_figdata(co,51,yr,Fsce)=Emis_Farm(co,6); % Emis_ric_ferpro
                    Co_figdata(co,52,yr,Fsce)=Emis_Farm(co,7); % Emis_whe_ferpro
                    Co_figdata(co,53,yr,Fsce)=Emis_Farm(co,8); % Emis_soy_ferpro
                    Co_figdata(co,54,yr,Fsce)=Emis_Farm(co,9); % Emis_mai_ele
                    Co_figdata(co,55,yr,Fsce)=Emis_Farm(co,10); % Emis_ric_ele
                    Co_figdata(co,56,yr,Fsce)=Emis_Farm(co,11); % Emis_whe_ele
                    Co_figdata(co,57,yr,Fsce)=Emis_Farm(co,12); % Emis_soy_ele
                    Co_figdata(co,58,yr,Fsce)=Emis_Farm(co,13); % Emis_mai_fuel
                    Co_figdata(co,59,yr,Fsce)=Emis_Farm(co,14); % Emis_ric_fuel
                    Co_figdata(co,60,yr,Fsce)=Emis_Farm(co,15); % Emis_whe_fuel
                    Co_figdata(co,61,yr,Fsce)=Emis_Farm(co,16); % Emis_soy_fuel
                    Co_figdata(co,62,yr,Fsce)=Emis_Farm(co,17); % Emis_mai_plafilm
                    Co_figdata(co,63,yr,Fsce)=Emis_Farm(co,18); % Emis_ric_plafilm
                    Co_figdata(co,64,yr,Fsce)=Emis_Farm(co,19); % Emis_whe_plafilm
                    Co_figdata(co,65,yr,Fsce)=Emis_Farm(co,20); % Emis_soy_plafilm
                    Co_figdata(co,66,yr,Fsce)=Emis_Farm(co,21); % Emis_mai_seed
                    Co_figdata(co,67,yr,Fsce)=Emis_Farm(co,22); % Emis_ric_seed
                    Co_figdata(co,68,yr,Fsce)=Emis_Farm(co,23); % Emis_whe_seed
                    Co_figdata(co,69,yr,Fsce)=Emis_Farm(co,24); % Emis_soy_seed
                    Co_figdata(co,70,yr,Fsce)=Emis_Farm(co,25); % Emis_mai_pest
                    Co_figdata(co,71,yr,Fsce)=Emis_Farm(co,26); % Emis_ric_pest
                    Co_figdata(co,72,yr,Fsce)=Emis_Farm(co,27); % Emis_whe_pest
                    Co_figdata(co,73,yr,Fsce)=Emis_Farm(co,28); % Emis_soy_pest
                    Co_figdata(co,74,yr,Fsce)=Emis_Farm(co,29); % Emis_mai_CH4
                    Co_figdata(co,75,yr,Fsce)=Emis_Farm(co,30); % Emis_ric_CH4
                    Co_figdata(co,76,yr,Fsce)=Emis_Farm(co,31); % Emis_whe_CH4
                    Co_figdata(co,77,yr,Fsce)=Emis_Farm(co,32); % Emis_soy_CH4
                    Co_figdata(co,78,yr,Fsce)=Emis_Farm(co,33); % Emis_mai_ferapp
                    Co_figdata(co,79,yr,Fsce)=Emis_Farm(co,34); % Emis_ric_ferapp
                    Co_figdata(co,80,yr,Fsce)=Emis_Farm(co,35); % Emis_whe_ferapp
                    Co_figdata(co,81,yr,Fsce)=Emis_Farm(co,36); % Emis_soy_ferapp
                    Co_figdata(co,82,yr,Fsce)=Cost_Farm(co,37); % Area of maize
                    Co_figdata(co,83,yr,Fsce)=Cost_Farm(co,38); % Area of rice
                    Co_figdata(co,84,yr,Fsce)=Cost_Farm(co,39); % Area of wheat
                    Co_figdata(co,85,yr,Fsce)=Cost_Farm(co,40); % Area of soy
                    
                end
            end
        end
        
        for Fsce=8:17
            display(Fsce)
%             for yr=27:61 % 27 is 2026;61 is 2060 year
            for yr=61 % 27 is 2026;61 is 2060 year
                display(yr)
                if Fsce==8 % large-scale farming
                    load(strcat('output\Result_sce\Sce_2\EC_Farm_fur','-',num2str(YSSP),'-',num2str(2),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_2\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(2),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_2\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(2),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                elseif Fsce==9 % fertilizer-enhancing FUE
                    load(strcat('output\Result_sce\Sce_3\EC_Farm_fur','-',num2str(YSSP),'-',num2str(3),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_3\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(3),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_3\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(3),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                elseif Fsce==10 % fertilizer-optimized fertilizer
                    load(strcat('output\Result_sce\Sce_4\EC_Farm_fur','-',num2str(YSSP),'-',num2str(4),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_4\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(4),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_4\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(4),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                elseif Fsce==11 % optimized planting date
                    load(strcat('output\Result_sce\Sce_5\EC_Farm_fur','-',num2str(YSSP),'-',num2str(5),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_5\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(5),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_5\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(5),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                elseif Fsce==12 % optimized plant density
                    load(strcat('output\Result_sce\Sce_6\EC_Farm_fur','-',num2str(YSSP),'-',num2str(6),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_6\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(6),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_6\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(6),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                elseif Fsce==13 % soil organic management
                    load(strcat('output\Result_sce\Sce_7\EC_Farm_fur','-',num2str(YSSP),'-',num2str(7),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_7\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(7),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_7\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(7),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                elseif Fsce==14 % optimized cultivar
                    load(strcat('output\Result_sce\Sce_8\EC_Farm_fur','-',num2str(YSSP),'-',num2str(8),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_8\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(8),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_8\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(8),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                elseif Fsce==15 % irrigation-enhancing efficiency
                    load(strcat('output\Result_sce\Sce_9\EC_Farm_fur','-',num2str(YSSP),'-',num2str(9),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_9\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(9),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_9\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(9),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                elseif Fsce==16 % irrigation-full irrigation
                    load(strcat('output\Result_sce\Sce_10\EC_Farm_fur','-',num2str(YSSP),'-',num2str(10),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_10\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(10),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_10\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(10),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                elseif Fsce==17 % multiple cropping systems
                    load(strcat('output\Result_sce\Sce_11\EC_Farm_fur','-',num2str(YSSP),'-',num2str(11),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_11\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(11),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                    load(strcat('output\Result_sce\Sce_11\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(11),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'-mat');% [1:CO_ID;2:Acrop 3:5:mai,ric and whe area;6:8:mai,ric,and whe pro;9:11:mai,ric and whe cost;12:14:mai,ric and whe emis;15:17:mai,ric and whe Residue;18:20:mai,rice and whe water;21:23:mai,ric and whe Nfer;24:26:mai,ric and whe Pfer;
                end
                
                EC_Farm=EC_Farm_fur;
                EC_Farm(isnan(EC_Farm)) =0;
                Cost_Farm=Cost_Farm_fur;
                Cost_Farm(isnan(Cost_Farm)) =0;
                Emis_Farm=Emis_Farm_fur;
                Emis_Farm(isnan(Emis_Farm)) =0;
                
                
                HZdata=zeros(size(EC_Farm,1),12);
                HZdata(:,1)=EC_Farm(:,1);% CO FID
                HZdata(:,2)=EC_Farm(:,2);% Acrop (ha)
                HZdata(:,3)=EC_Farm(:,4);% crop production (t)
                HZdata(:,4)=EC_Farm(:,5);% crop cost ($)
                HZdata(:,5)=EC_Farm(:,6);% crop emis (t CO₂e)
                HZdata(:,6)=EC_Farm(:,7);% crop residue (t)
                HZdata(:,7)=EC_Farm(:,8);% water (m3)
                HZdata(:,8)=EC_Farm(:,9);% Nfer (kg N)
                HZdata(:,9)=EC_Farm(:,10);% Pfer (kg P)
                
                RRatio=sum(EC_Farm(:,[11 12 13 14]),2)./EC_Farm(:,2);% Ratio of increased land [11:bareland;12:grassland;13:shurbland;14:forest]
                HZdata(:,12)=EC_Farm(:,14);% Occupied forest area (ha)+grassland+shurbland
                HZdata(:,13)=sum(EC_Farm(:,[12 14]),2);% Occupied forest
%                 area (ha)+grassland+shurbland, just used for Fig6
                
                
                HZdata(:,14)=Cost_Farm(:,1); % Pro_mai
                HZdata(:,15)=Cost_Farm(:,2); % Pro_ric
                HZdata(:,16)=Cost_Farm(:,3); % Pro_whe
                HZdata(:,17)=Cost_Farm(:,4); % Pro_soy
                HZdata(:,18)=Cost_Farm(:,5); % Cost_mai_conv
                HZdata(:,19)=Cost_Farm(:,6); % Cost_ric_conv
                HZdata(:,20)=Cost_Farm(:,7); % Cost_whe_conv
                HZdata(:,21)=Cost_Farm(:,8); % Cost_soy_conv
                HZdata(:,22)=Cost_Farm(:,9); % Cost_mai_mach
                HZdata(:,23)=Cost_Farm(:,10); % Cost_ric_mach
                HZdata(:,24)=Cost_Farm(:,11); % Cost_whe_mach
                HZdata(:,25)=Cost_Farm(:,12); % Cost_soy_mach
                HZdata(:,26)=Cost_Farm(:,13); % Cost_mai_labor
                HZdata(:,27)=Cost_Farm(:,14); % Cost_ric_labor
                HZdata(:,28)=Cost_Farm(:,15); % Cost_whe_labor
                HZdata(:,29)=Cost_Farm(:,16); % Cost_soy_labor
                HZdata(:,30)=Cost_Farm(:,17); % Cost_mai_Nfer
                HZdata(:,31)=Cost_Farm(:,18); % Cost_ric_Nfer
                HZdata(:,32)=Cost_Farm(:,19); % Cost_whe_Nfer
                HZdata(:,33)=Cost_Farm(:,20); % Cost_soy_Nfer
                HZdata(:,34)=Cost_Farm(:,21); % Cost_mai_water
                HZdata(:,35)=Cost_Farm(:,22); % Cost_ric_water
                HZdata(:,36)=Cost_Farm(:,23); % Cost_whe_water
                HZdata(:,37)=Cost_Farm(:,24); % Cost_soy_water
                HZdata(:,38)=Cost_Farm(:,25); % Cost_mai_seed
                HZdata(:,39)=Cost_Farm(:,26); % Cost_ric_seed
                HZdata(:,40)=Cost_Farm(:,27); % Cost_whe_seed
                HZdata(:,41)=Cost_Farm(:,28); % Cost_soy_seed
                HZdata(:,42)=Cost_Farm(:,29); % Cost_mai_land
                HZdata(:,43)=Cost_Farm(:,30); % Cost_ric_land
                HZdata(:,44)=Cost_Farm(:,31); % Cost_whe_land     
                HZdata(:,45)=Cost_Farm(:,32); % Cost_soy_land     
                HZdata(:,46)=Cost_Farm(:,33); % Cost_mai_other
                HZdata(:,47)=Cost_Farm(:,34); % Cost_ric_other
                HZdata(:,48)=Cost_Farm(:,35); % Cost_whe_other
                HZdata(:,49)=Cost_Farm(:,36); % Cost_soy_other
               
                HZdata(:,50)=Emis_Farm(:,1); % Emis_mai_ELUC
                HZdata(:,51)=Emis_Farm(:,2); % Emis_ric_ELUC
                HZdata(:,52)=Emis_Farm(:,3); % Emis_whe_ELUC
                HZdata(:,53)=Emis_Farm(:,4); % Emis_soy_ELUC
                HZdata(:,54)=Emis_Farm(:,5); % Emis_mai_ferpro
                HZdata(:,55)=Emis_Farm(:,6); % Emis_ric_ferpro
                HZdata(:,56)=Emis_Farm(:,7); % Emis_whe_ferpro
                HZdata(:,57)=Emis_Farm(:,8); % Emis_soy_ferpro
                HZdata(:,58)=Emis_Farm(:,9); % Emis_mai_ele
                HZdata(:,59)=Emis_Farm(:,10); % Emis_ric_ele
                HZdata(:,60)=Emis_Farm(:,11); % Emis_whe_ele
                HZdata(:,61)=Emis_Farm(:,12); % Emis_soy_ele
                HZdata(:,62)=Emis_Farm(:,13); % Emis_mai_fuel
                HZdata(:,63)=Emis_Farm(:,14); % Emis_ric_fuel
                HZdata(:,64)=Emis_Farm(:,15); % Emis_whe_fuel
                HZdata(:,65)=Emis_Farm(:,16); % Emis_soy_fuel
                HZdata(:,66)=Emis_Farm(:,17); % Emis_mai_plafilm
                HZdata(:,67)=Emis_Farm(:,18); % Emis_ric_plafilm
                HZdata(:,68)=Emis_Farm(:,19); % Emis_whe_plafilm
                HZdata(:,69)=Emis_Farm(:,20); % Emis_soy_plafilm
                HZdata(:,70)=Emis_Farm(:,21); % Emis_mai_seed
                HZdata(:,71)=Emis_Farm(:,22); % Emis_ric_seed
                HZdata(:,72)=Emis_Farm(:,23); % Emis_whe_seed
                HZdata(:,73)=Emis_Farm(:,24); % Emis_soy_seed
                HZdata(:,74)=Emis_Farm(:,25); % Emis_mai_pest
                HZdata(:,75)=Emis_Farm(:,26); % Emis_ric_pest
                HZdata(:,76)=Emis_Farm(:,27); % Emis_whe_pest
                HZdata(:,77)=Emis_Farm(:,28); % Emis_soy_pest
                HZdata(:,78)=Emis_Farm(:,29); % Emis_mai_CH4
                HZdata(:,79)=Emis_Farm(:,30); % Emis_ric_CH4
                HZdata(:,80)=Emis_Farm(:,31); % Emis_whe_CH4
                HZdata(:,81)=Emis_Farm(:,32); % Emis_soy_CH4
                HZdata(:,82)=Emis_Farm(:,33); % Emis_mai_ferapp
                HZdata(:,83)=Emis_Farm(:,34); % Emis_ric_ferapp
                HZdata(:,84)=Emis_Farm(:,35); % Emis_whe_ferapp
                HZdata(:,85)=Emis_Farm(:,36); % Emis_soy_ferapp
                HZdata(:,86)=Cost_Farm(:,37); % Area of maize
                HZdata(:,87)=Cost_Farm(:,38); % Area of rice
                HZdata(:,88)=Cost_Farm(:,39); % Area of wheat
                HZdata(:,89)=Cost_Farm(:,40); % Area of soy
               
                for co=1:2836
                    idd=find(HZdata(:,1)==co-1 & RRatio<=0.87);
                    if size(idd,1)>0
                        Co_figdata(co,1,yr,Fsce)=sum(HZdata(idd,2)); % Acrop (ha)
                        Co_figdata(co,2,yr,Fsce)=sum(HZdata(idd,3));% Crop production (t)
                        Co_figdata(co,3,yr,Fsce)=sum(HZdata(idd,7));% water (m3)
                        Co_figdata(co,4,yr,Fsce)=sum(HZdata(idd,8));% Nfer (kg N)
                        Co_figdata(co,5,yr,Fsce)=sum(HZdata(idd,4)); % Crop cost ($)
                        Co_figdata(co,6,yr,Fsce)=sum(HZdata(idd,5));% crop emis (t CO₂e)
                        Co_figdata(co,7,yr,Fsce)=sum(HZdata(idd,12)); % Occupied forest area by large-scale farming (ha)
                        Co_figdata(co,8,yr,Fsce)=sum(HZdata(idd,6)); % crop residue (t)
                        Co_figdata(co,9,yr,Fsce)=sum(HZdata(idd,13)); % Occupied forest + grassland area by large-scale farming (ha)
                        
                        Co_figdata(co,10,yr,Fsce)=sum(HZdata(idd,14)); % Pro_mai
                        Co_figdata(co,11,yr,Fsce)=sum(HZdata(idd,15)); % Pro_ric
                        Co_figdata(co,12,yr,Fsce)=sum(HZdata(idd,16)); % Pro_whe
                        Co_figdata(co,13,yr,Fsce)=sum(HZdata(idd,17)); % Pro_soy
                        Co_figdata(co,14,yr,Fsce)=sum(HZdata(idd,18)); % Cost_mai_conv
                        Co_figdata(co,15,yr,Fsce)=sum(HZdata(idd,19)); % Cost_ric_conv
                        Co_figdata(co,16,yr,Fsce)=sum(HZdata(idd,20)); % Cost_whe_conv
                        Co_figdata(co,17,yr,Fsce)=sum(HZdata(idd,21)); % Cost_soy_conv
                        Co_figdata(co,18,yr,Fsce)=sum(HZdata(idd,22)); % Cost_mai_mach
                        Co_figdata(co,19,yr,Fsce)=sum(HZdata(idd,23)); % Cost_ric_mach
                        Co_figdata(co,20,yr,Fsce)=sum(HZdata(idd,24)); % Cost_whe_mach
                        Co_figdata(co,21,yr,Fsce)=sum(HZdata(idd,25)); % Cost_soy_mach
                        Co_figdata(co,22,yr,Fsce)=sum(HZdata(idd,26)); % Cost_mai_labor
                        Co_figdata(co,23,yr,Fsce)=sum(HZdata(idd,27)); % Cost_ric_labor
                        Co_figdata(co,24,yr,Fsce)=sum(HZdata(idd,28)); % Cost_whe_labor
                        Co_figdata(co,25,yr,Fsce)=sum(HZdata(idd,29)); % Cost_soy_labor
                        Co_figdata(co,26,yr,Fsce)=sum(HZdata(idd,30)); % Cost_mai_Nfer
                        Co_figdata(co,27,yr,Fsce)=sum(HZdata(idd,31)); % Cost_ric_Nfer
                        Co_figdata(co,28,yr,Fsce)=sum(HZdata(idd,32)); % Cost_whe_Nfer
                        Co_figdata(co,29,yr,Fsce)=sum(HZdata(idd,33)); % Cost_soy_Nfer
                        Co_figdata(co,30,yr,Fsce)=sum(HZdata(idd,34)); % Cost_mai_water
                        Co_figdata(co,31,yr,Fsce)=sum(HZdata(idd,35)); % Cost_ric_water
                        Co_figdata(co,32,yr,Fsce)=sum(HZdata(idd,36)); % Cost_whe_water
                        Co_figdata(co,33,yr,Fsce)=sum(HZdata(idd,37)); % Cost_soy_water
                        Co_figdata(co,34,yr,Fsce)=sum(HZdata(idd,38)); % Cost_mai_seed
                        Co_figdata(co,35,yr,Fsce)=sum(HZdata(idd,39)); % Cost_ric_seed
                        Co_figdata(co,36,yr,Fsce)=sum(HZdata(idd,40)); % Cost_whe_seed
                        Co_figdata(co,37,yr,Fsce)=sum(HZdata(idd,41)); % Cost_soy_seed
                        Co_figdata(co,38,yr,Fsce)=sum(HZdata(idd,42)); % Cost_mai_land
                        Co_figdata(co,39,yr,Fsce)=sum(HZdata(idd,43)); % Cost_ric_land
                        Co_figdata(co,40,yr,Fsce)=sum(HZdata(idd,44)); % Cost_whe_land     
                        Co_figdata(co,41,yr,Fsce)=sum(HZdata(idd,45)); % Cost_soy_land     
                        Co_figdata(co,42,yr,Fsce)=sum(HZdata(idd,46)); % Cost_mai_other
                        Co_figdata(co,43,yr,Fsce)=sum(HZdata(idd,47)); % Cost_ric_other
                        Co_figdata(co,44,yr,Fsce)=sum(HZdata(idd,48)); % Cost_whe_other
                        Co_figdata(co,45,yr,Fsce)=sum(HZdata(idd,49)); % Cost_soy_other
                      
                        Co_figdata(co,46,yr,Fsce)=sum(HZdata(idd,50)); % Emis_mai_ELUC
                        Co_figdata(co,47,yr,Fsce)=sum(HZdata(idd,51)); % Emis_ric_ELUC
                        Co_figdata(co,48,yr,Fsce)=sum(HZdata(idd,52)); % Emis_whe_ELUC
                        Co_figdata(co,49,yr,Fsce)=sum(HZdata(idd,53)); % Emis_soy_ELUC
                        Co_figdata(co,50,yr,Fsce)=sum(HZdata(idd,54)); % Emis_mai_ferpro
                        Co_figdata(co,51,yr,Fsce)=sum(HZdata(idd,55)); % Emis_ric_ferpro
                        Co_figdata(co,52,yr,Fsce)=sum(HZdata(idd,56)); % Emis_whe_ferpro
                        Co_figdata(co,53,yr,Fsce)=sum(HZdata(idd,57)); % Emis_soy_ferpro
                        Co_figdata(co,54,yr,Fsce)=sum(HZdata(idd,58)); % Emis_mai_ele
                        Co_figdata(co,55,yr,Fsce)=sum(HZdata(idd,59)); % Emis_ric_ele
                        Co_figdata(co,56,yr,Fsce)=sum(HZdata(idd,60)); % Emis_whe_ele
                        Co_figdata(co,57,yr,Fsce)=sum(HZdata(idd,61)); % Emis_soy_ele
                        Co_figdata(co,58,yr,Fsce)=sum(HZdata(idd,62)); % Emis_mai_fuel
                        Co_figdata(co,59,yr,Fsce)=sum(HZdata(idd,63)); % Emis_ric_fuel
                        Co_figdata(co,60,yr,Fsce)=sum(HZdata(idd,64)); % Emis_whe_fuel
                        Co_figdata(co,61,yr,Fsce)=sum(HZdata(idd,65)); % Emis_soy_fuel
                        Co_figdata(co,62,yr,Fsce)=sum(HZdata(idd,66)); % Emis_mai_plafilm
                        Co_figdata(co,63,yr,Fsce)=sum(HZdata(idd,67)); % Emis_ric_plafilm
                        Co_figdata(co,64,yr,Fsce)=sum(HZdata(idd,68)); % Emis_whe_plafilm
                        Co_figdata(co,65,yr,Fsce)=sum(HZdata(idd,69)); % Emis_soy_plafilm
                        Co_figdata(co,66,yr,Fsce)=sum(HZdata(idd,70)); % Emis_mai_seed
                        Co_figdata(co,67,yr,Fsce)=sum(HZdata(idd,71)); % Emis_ric_seed
                        Co_figdata(co,68,yr,Fsce)=sum(HZdata(idd,72)); % Emis_whe_seed
                        Co_figdata(co,69,yr,Fsce)=sum(HZdata(idd,73)); % Emis_soy_seed
                        Co_figdata(co,70,yr,Fsce)=sum(HZdata(idd,74)); % Emis_mai_pest
                        Co_figdata(co,71,yr,Fsce)=sum(HZdata(idd,75)); % Emis_ric_pest
                        Co_figdata(co,72,yr,Fsce)=sum(HZdata(idd,76)); % Emis_whe_pest
                        Co_figdata(co,73,yr,Fsce)=sum(HZdata(idd,77)); % Emis_soy_pest
                        Co_figdata(co,74,yr,Fsce)=sum(HZdata(idd,78)); % Emis_mai_CH4
                        Co_figdata(co,75,yr,Fsce)=sum(HZdata(idd,79)); % Emis_ric_CH4
                        Co_figdata(co,76,yr,Fsce)=sum(HZdata(idd,80)); % Emis_whe_CH4
                        Co_figdata(co,77,yr,Fsce)=sum(HZdata(idd,81)); % Emis_soy_CH4
                        Co_figdata(co,78,yr,Fsce)=sum(HZdata(idd,82)); % Emis_mai_ferapp
                        Co_figdata(co,79,yr,Fsce)=sum(HZdata(idd,83)); % Emis_ric_ferapp
                        Co_figdata(co,80,yr,Fsce)=sum(HZdata(idd,84)); % Emis_whe_ferapp
                        Co_figdata(co,81,yr,Fsce)=sum(HZdata(idd,85)); % Emis_soy_ferapp
                        Co_figdata(co,82,yr,Fsce)=sum(HZdata(idd,86)); % Area of maize
                        Co_figdata(co,83,yr,Fsce)=sum(HZdata(idd,87)); % Area of rice
                        Co_figdata(co,84,yr,Fsce)=sum(HZdata(idd,88)); % Area of wheat
                        Co_figdata(co,85,yr,Fsce)=sum(HZdata(idd,89)); % Area of soy
                       
                    end
                end
            end
        end
        save(strcat('output/Co_figdata/Co_figdata','-',num2str(YSSP),'-',num2str(Mo_EC),'.dat'),'Co_figdata','-v7.3');
    end
end

sum(Co_figdata(:,1,61,8))/10^6

