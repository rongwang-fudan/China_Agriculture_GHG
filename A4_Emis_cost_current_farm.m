clc;
clear;
% This code is used to generate the agricultural emissions and production scenarios for 2836 counties in China under the current farmland before large-scale farmming.
SRario=xlsread('input/crop_par', 'SRario', 'D2:D2837');
for Mo_EC=1:3 % 1 is the min,2 is the mean, 3 is the max
    % load the input and emission factor
    if Mo_EC==1
        maize_input=xlsread('input/crop_par', 'Input_mai', 'B3:M33')*0.9; % 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
        rice_input=xlsread('input/crop_par', 'Input_ric', 'B3:M33')*0.9; % 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
        wheat_input=xlsread('input/crop_par', 'Input_whe', 'B3:M33')*0.9; % 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
        soy_input=xlsread('input/crop_par', 'Input_soy', 'B3:M33')*0.9; % 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
        
        maize_EF=xlsread('input/crop_par', 'EF_mai', 'C34:N64')*0.9; % 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
        rice_EF=xlsread('input/crop_par', 'EF_ric', 'C34:N64')*0.9; % 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
        wheat_EF=xlsread('input/crop_par', 'EF_whe', 'C34:N64')*0.9; % 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
        soy_EF=xlsread('input/crop_par', 'EF_soy', 'C34:N64')*0.9; % 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
        ELUC_EF=[25 136300 183025 573200 573200]*0.9;% EF factor of bare, grass, shurb, and forest area.
    elseif Mo_EC==2
        maize_input=xlsread('input/crop_par', 'Input_mai', 'B3:M33'); % 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
        rice_input=xlsread('input/crop_par', 'Input_ric', 'B3:M33'); % 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
        wheat_input=xlsread('input/crop_par', 'Input_whe', 'B3:M33'); % 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
        soy_input=xlsread('input/crop_par', 'Input_soy', 'B3:M33'); % 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
        
        maize_EF=xlsread('input/crop_par', 'EF_mai', 'C34:N64'); % 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
        rice_EF=xlsread('input/crop_par', 'EF_ric', 'C34:N64'); % 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5: (kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
        wheat_EF=xlsread('input/crop_par', 'EF_whe', 'C34:N64'); % 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
        soy_EF=xlsread('input/crop_par', 'EF_soy', 'C34:N64'); % 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
        ELUC_EF=[25 136300 183025 573200 573200];% EF factor of bare, grass, shurb, and forest area.
    elseif Mo_EC==3
        maize_input=xlsread('input/crop_par', 'Input_mai', 'B3:M33')*1.1; % 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
        rice_input=xlsread('input/crop_par', 'Input_ric', 'B3:M33')*1.1; % 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
        wheat_input=xlsread('input/crop_par', 'Input_whe', 'B3:M33')*1.1; % 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
        soy_input=xlsread('input/crop_par', 'Input_soy', 'B3:M33')*1.1; % 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
        
        maize_EF=xlsread('input/crop_par', 'EF_mai', 'C34:N64')*1.1; % 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
        rice_EF=xlsread('input/crop_par', 'EF_ric', 'C34:N64')*1.1; % 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
        wheat_EF=xlsread('input/crop_par', 'EF_whe', 'C34:N64')*1.1; % 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
        soy_EF=xlsread('input/crop_par', 'EF_soy', 'C34:N64')*1.1; % 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
        ELUC_EF=[25 136300 183025 573200 573200]*1.1;% EF factor of bare, grass, shurb, and forest area.
    end
    % load the cost
    maize_cost=xlsread('input/crop_par', 'Cost_mai', 'B3:Y33'); % 1:pro ID; 3:N fer; 4:P fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
    maize_cost(:,2:end)=maize_cost(:,2:end)*15/7.17;% ($/ha)
    rice_cost=xlsread('input/crop_par', 'Cost_ric', 'B3:Y33'); % 1:pro ID; 3:N fer; 4:P fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
    rice_cost(:,2:end)=rice_cost(:,2:end)*15/7.17;% ($/ha)
    wheat_cost=xlsread('input/crop_par', 'Cost_whe', 'B3:Y33'); % 1:pro ID; 3:N fer; 4:P fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
    wheat_cost(:,2:end)=wheat_cost(:,2:end)*15/7.17;% ($/ha)
    soy_cost=xlsread('input/crop_par', 'Cost_soy', 'B3:Y33'); % 1:pro ID; 3:N fer; 4:P fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
    soy_cost(:,2:end)=soy_cost(:,2:end)*15/7.17;% ($/ha)
    conso_cost=xlsread('input/crop_par', 'Cost_Con', 'B3:C33'); % 1:pro ID; 2:consolidation cost (yuan/ha);
    if Mo_EC==1
        conso_cost(:,2)=conso_cost(:,2)*0.9*1000/7.17;% (consolidation cost $/ha)
    elseif Mo_EC==2
        conso_cost(:,2)=conso_cost(:,2)*1.0*1000/7.17;% (consolidation cost $/ha)
    elseif Mo_EC==3
        conso_cost(:,2)=conso_cost(:,2)*1.1*1000/7.17;% (consolidation cost $/ha)
    end
    
    load('output\IrrWater_par.dat','-mat');
    load('output\FCo_3yieldarea.dat','-mat');
    
    COmaize_cost=zeros(2836,26);
    COrice_cost=zeros(2836,26);
    COwheat_cost=zeros(2836,26);
    COsoy_cost=zeros(2836,26);
    COmaize_input=zeros(2836,12);
    COrice_input=zeros(2836,12);
    COwheat_input=zeros(2836,12);
    COsoy_input=zeros(2836,12);
    COmaize_EF=zeros(2836,12);
    COrice_EF=zeros(2836,12);
    COwheat_EF=zeros(2836,12);
    COsoy_EF=zeros(2836,12);
    idk=find(IrrWater_par(:,7)==0);IrrWater_par(idk,7)=0.3;
    for pro=1:31
        idd=find(FCo_3yieldarea(:,2,1,1)==maize_cost(pro,1));
        COmaize_cost(idd,1:24)=repmat(maize_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
        COrice_cost(idd,1:24)=repmat(rice_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
        COwheat_cost(idd,1:24)=repmat(wheat_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
        COsoy_cost(idd,1:24)=repmat(soy_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
        COmaize_cost(idd,11)=repmat(IrrWater_par(pro,8),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
        COmaize_cost(idd,25)=repmat(IrrWater_par(pro,8),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
        COrice_cost(idd,11)=repmat(IrrWater_par(pro,9),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
        COrice_cost(idd,25)=repmat(IrrWater_par(pro,9),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
        COwheat_cost(idd,11)=repmat(IrrWater_par(pro,10),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
        COwheat_cost(idd,25)=repmat(IrrWater_par(pro,10),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
        COsoy_cost(idd,11)=repmat(IrrWater_par(pro,11),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
        COsoy_cost(idd,25)=repmat(IrrWater_par(pro,11),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
        
        COmaize_cost(idd,26)=0;% consolidation cost $/ha
        COrice_cost(idd,26)=0;% consolidation cost $/ha
        COwheat_cost(idd,26)=0;% consolidation cost $/ha
        COsoy_cost(idd,26)=0;% consolidation cost $/ha
        
        COmaize_input(idd,1:12)=repmat(maize_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha) 2023-Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China
        COrice_input(idd,1:12)=repmat(rice_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha) 2023-Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China
        COwheat_input(idd,1:12)=repmat(wheat_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha) 2023-Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China
        COsoy_input(idd,1:12)=repmat(soy_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha) 2023-Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China
        COmaize_EF(idd,1:12)=repmat(maize_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%) 2023-Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China
        COrice_EF(idd,1:12)=repmat(rice_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%) 2023-Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China
        COwheat_EF(idd,1:12)=repmat(wheat_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%) 2023-Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China
        COsoy_EF(idd,1:12)=repmat(soy_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%) 2023-Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China
    end
    save('output\COmaize_cost.dat','COmaize_cost','-v7.3');% 1:pro ID; 3:N fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
    save('output\COrice_cost.dat','COrice_cost','-v7.3');% 1:pro ID; 3:N fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
    save('output\COwheat_cost.dat','COwheat_cost','-v7.3');% 1:pro ID; 3:N fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
    save('output\COsoy_cost.dat','COsoy_cost','-v7.3');% 1:pro ID; 3:N fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
    save('output\COmaize_input.dat','COmaize_input','-v7.3');% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
    save('output\COrice_input.dat','COrice_input','-v7.3');% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
    save('output\COwheat_input.dat','COwheat_input','-v7.3');% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
    save('output\COsoy_input.dat','COsoy_input','-v7.3');% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
    save('output\COmaize_EF.dat','COmaize_EF','-v7.3');% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
    save('output\COrice_EF.dat','COrice_EF','-v7.3');% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
    save('output\COwheat_EF.dat','COwheat_EF','-v7.3');% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
    save('output\COsoy_EF.dat','COsoy_EF','-v7.3');% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
    
    load('output\Grid1_Rurban_SSP1.dat','-mat');% urabn ratio from 2020 to 2060 for SSP3 sce.
    load('output\Grid1_Rurban_SSP2.dat','-mat');% urabn ratio from 2020 to 2060 for SSP3 sce.
    load('output\Grid1_Rurban_SSP3.dat','-mat');% urabn ratio from 2020 to 2060 for SSP3 sce.
    load('output\Grid1_Rurban_SSP4.dat','-mat');% urabn ratio from 2020 to 2060 for SSP3 sce.
    load('output\Grid1_Rurban_SSP5.dat','-mat');% urabn ratio from 2020 to 2060 for SSP5 sce.
    load('output\Grid001_data.dat','-mat');
    % 1:FID;2:grid area;3:CO_ID;4:surimpreous;5:protect;6:available land;7:lon;8:lat;9:forest;10:grass;11:wetland;12:cropland;13:urban;14:ice;15:barren;16:water;
    load('output\FCo_3yieldarea.dat','-mat');% 1:2836 COID;2:34 ProID;3:5 yield of maize,rice and wheat;6:8:area of maize,rice and wheat;9:% sum of land in each country;10:farm scale.
    
    Cocurfarm_SSP1=zeros(2836,61);
    % Cocurfarm_SSP2=zeros(2836,61);
    % Cocurfarm_SSP3=zeros(2836,61);
    % Cocurfarm_SSP4=zeros(2836,61);
    % Cocurfarm_SSP5=zeros(2836,61);
    Cropland_FAO=[135449.8 134692.5 133934.8 133179.5 132426.8 131671.5 130916.5 130163.3 129408.6 128656.2 128655.1 128652 127600]*1000;% FAO cropland area from 2010 to 2022 year.
    Co_crop2010_2021 =importdata('input\Grid1d\MODIS\Co_crop2010_2021.txt');% 1:CO FID;2:pro ID 3:14:country cropland by 2010 to 2021.
    RCo_crop2010_2021=Co_crop2010_2021;
    for col=3:14
        RCo_crop2010_2021(:,col)=Cropland_FAO(col-2)/sum(Co_crop2010_2021(:,col))*Co_crop2010_2021(:,col);
    end
    
    
    Cocurfarm_SSP1(:,11:22)=RCo_crop2010_2021(:,3:14);
    for yr=61 % from 2022 to 2060
        display(yr)
        if yr<=26
            Cropland=Grid001_data(:,12)-max(0,(Grid1_Rurban_SSP5(:,yr-20)-Grid1_Rurban_SSP5(:,3))).*Grid001_data(:,2);% cropland area in yr year
        elseif yr>=27
            Cropland=Grid001_data(:,12)-max(0,(Grid1_Rurban_SSP5(:,26-20)-Grid1_Rurban_SSP5(:,3))).*Grid001_data(:,2)-max(0,(Grid1_Rurban_SSP1(:,yr-20)-Grid1_Rurban_SSP1(:,6))).*Grid001_data(:,2);% cropland area in yr year
        end
        idk=find(Cropland<0);Cropland(idk,1)=0;
        for co=1:2836
            idco=find(Grid001_data(:,3)==co-1);
            if size(idco,1)>0
                Cocurfarm_SSP1(co,yr)=sum(Cropland(idco,1));
            end
        end
    end
    save('output\Cocurfarm_SSP1.dat','Cocurfarm_SSP1','-v7.3');
    clear Cocurfarm_SSP1;
    
    
    Cocurfarm_SSP2(:,11:22)=RCo_crop2010_2021(:,3:14);
    for yr=61 % from 2022 to 2060
        display(yr)
        if yr<=26
            Cropland=Grid001_data(:,12)-max(0,(Grid1_Rurban_SSP5(:,yr-20)-Grid1_Rurban_SSP5(:,3))).*Grid001_data(:,2);% cropland area in yr year
        elseif yr>=27
            Cropland=Grid001_data(:,12)-max(0,(Grid1_Rurban_SSP5(:,26-20)-Grid1_Rurban_SSP5(:,3))).*Grid001_data(:,2)-max(0,(Grid1_Rurban_SSP2(:,yr-20)-Grid1_Rurban_SSP2(:,6))).*Grid001_data(:,2);% cropland area in yr year
        end
        idk=find(Cropland<0);Cropland(idk,1)=0;
        for co=1:2836
            idco=find(Grid001_data(:,3)==co-1);
            if size(idco,1)>0
                Cocurfarm_SSP2(co,yr)=sum(Cropland(idco,1));
            end
        end
    end
    save('output\Cocurfarm_SSP2.dat','Cocurfarm_SSP2','-v7.3');
    clear Cocurfarm_SSP2;
    
    
    Cocurfarm_SSP3(:,11:22)=RCo_crop2010_2021(:,3:14);
    for yr=61 % from 2022 to 2060
        display(yr)
        if yr<=26
            Cropland=Grid001_data(:,12)-max(0,(Grid1_Rurban_SSP5(:,yr-20)-Grid1_Rurban_SSP5(:,3))).*Grid001_data(:,2);% cropland area in yr year
        elseif yr>=27
            Cropland=Grid001_data(:,12)-max(0,(Grid1_Rurban_SSP5(:,26-20)-Grid1_Rurban_SSP5(:,3))).*Grid001_data(:,2)-max(0,(Grid1_Rurban_SSP3(:,yr-20)-Grid1_Rurban_SSP3(:,6))).*Grid001_data(:,2);% cropland area in yr year
        end
        idk=find(Cropland<0);Cropland(idk,1)=0;
        for co=1:2836
            idco=find(Grid001_data(:,3)==co-1);
            if size(idco,1)>0
                Cocurfarm_SSP3(co,yr)=sum(Cropland(idco,1));
            end
        end
    end
    save('output\Cocurfarm_SSP3.dat','Cocurfarm_SSP3','-v7.3');
    clear Cocurfarm_SSP3;
    
    
    Cocurfarm_SSP4(:,11:22)=RCo_crop2010_2021(:,3:14);
    for yr=61 % from 2022 to 2060
        display(yr)
        if yr<=26
            Cropland=Grid001_data(:,12)-max(0,(Grid1_Rurban_SSP5(:,yr-20)-Grid1_Rurban_SSP5(:,3))).*Grid001_data(:,2);% cropland area in yr year
        elseif yr>=27
            Cropland=Grid001_data(:,12)-max(0,(Grid1_Rurban_SSP5(:,26-20)-Grid1_Rurban_SSP5(:,3))).*Grid001_data(:,2)-max(0,(Grid1_Rurban_SSP4(:,yr-20)-Grid1_Rurban_SSP4(:,6))).*Grid001_data(:,2);% cropland area in yr year
        end
        idk=find(Cropland<0);Cropland(idk,1)=0;
        for co=1:2836
            idco=find(Grid001_data(:,3)==co-1);
            if size(idco,1)>0
                Cocurfarm_SSP4(co,yr)=sum(Cropland(idco,1));
            end
        end
    end
    save('output\Cocurfarm_SSP4.dat','Cocurfarm_SSP4','-v7.3');
    clear Cocurfarm_SSP4;
    
    Cocurfarm_SSP5(:,11:22)=RCo_crop2010_2021(:,3:14);
    for yr=61 % from 2022 to 2060
        display(yr)
        if yr<=26
            Cropland=Grid001_data(:,12)-max(0,(Grid1_Rurban_SSP5(:,yr-20)-Grid1_Rurban_SSP5(:,3))).*Grid001_data(:,2);% cropland area in yr year
        elseif yr>=27
            Cropland=Grid001_data(:,12)-max(0,(Grid1_Rurban_SSP5(:,26-20)-Grid1_Rurban_SSP5(:,3))).*Grid001_data(:,2)-max(0,(Grid1_Rurban_SSP5(:,yr-20)-Grid1_Rurban_SSP5(:,6))).*Grid001_data(:,2);% cropland area in yr year
        end
        idk=find(Cropland<0);Cropland(idk,1)=0;
        for co=1:2836
            idco=find(Grid001_data(:,3)==co-1);
            if size(idco,1)>0
                Cocurfarm_SSP5(co,yr)=sum(Cropland(idco,1));
            end
        end
    end
    save('output\Cocurfarm_SSP5.dat','Cocurfarm_SSP5','-v7.3');
    clear Cocurfarm_SSP5;
    

    load('output\Cocurfarm_SSP1.dat','-mat');
    load('output\Cocurfarm_SSP2.dat','-mat');
    load('output\Cocurfarm_SSP3.dat','-mat');
    load('output\Cocurfarm_SSP4.dat','-mat');
    load('output\Cocurfarm_SSP5.dat','-mat');
    load('output\COmaize_cost.dat','-mat');% 1:pro ID; 3:N fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);2:seed cost;24 land cost
    load('output\COrice_cost.dat','-mat');% 1:pro ID; 3:N fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);2:seed cost;24 land cost
    load('output\COwheat_cost.dat','-mat');% 1:pro ID; 3:N fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);2:seed cost;24 land cost
    load('output\COsoy_cost.dat','-mat');% 1:pro ID; 3:N fer; 6:manure; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);2:seed cost;24 land cost
    if Mo_EC==1
        COmaize_cost(:,2:26)=COmaize_cost(:,2:26)*0.9;
        COrice_cost(:,2:26)=COrice_cost(:,2:26)*0.9;
        COwheat_cost(:,2:26)=COwheat_cost(:,2:26)*0.9;
    elseif Mo_EC==2
        COmaize_cost(:,2:26)=COmaize_cost(:,2:26);
        COrice_cost(:,2:26)=COrice_cost(:,2:26);
        COwheat_cost(:,2:26)=COwheat_cost(:,2:26);
    elseif Mo_EC==3
        COmaize_cost(:,2:26)=COmaize_cost(:,2:26)*1.1;
        COrice_cost(:,2:26)=COrice_cost(:,2:26)*1.1;
        COwheat_cost(:,2:26)=COwheat_cost(:,2:26)*1.1;
    end
    for YSSP=2 % RCP4.5 climate scenario
        for sce=1 % the former three sce is for current farms, while the last four is for further farms
            display(sce)
            if sce==1 % current farm sce (SSP5 urbanization, RCP8.5 climate change)
                Coyield=zeros(2836,8,61);
                %                 for yr=11:61 % from 2010 to 2060
                for yr=61 % from 2010 to 2060
                    Coyield(:,1:4,yr)=FCo_3yieldarea(:,3:6,yr,YSSP);% yield of maize, rice and wheat（t/ha）
                    Coyield(:,5:8,yr)=FCo_3yieldarea(:,7:10,yr,YSSP)./FCo_3yieldarea(:,11,yr,YSSP);% ratio of maize, rice, and wheat area （ha）
                end
                save('output\Coyield.dat','Coyield','-v7.3');
                
                %                 for yr=11:61 % from 2010 to 2060
                for yr=61 % from 2010 to 2060
                    display(yr)
                    Cocurfarm=Cocurfarm_SSP1;
                    Cocurfarm(:,25:61)=repmat(Cocurfarm(:,24),1,37); % the 2024-2060 pop is equal to 2023
                    Grid1_cur_cropCE;
                    save(strcat('output\Result_sce\Sce_1_noSSP\EC_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_cur','-v7.3');
                    save(strcat('output\Result_sce\Sce_1_noSSP\Cost_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_cur','-v7.3');
                    save(strcat('output\Result_sce\Sce_1_noSSP\Emis_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_cur','-v7.3');
                end
                
                %                 for yr=11:61 % from 2010 to 2060
                for yr=61 % from 2010 to 2060
                    display(yr)
                    Cocurfarm=Cocurfarm_SSP1;
                    Grid1_cur_cropCE;
                    save(strcat('output\Result_sce\Sce_1_SSP1\EC_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_cur','-v7.3');
                    save(strcat('output\Result_sce\Sce_1_SSP1\Cost_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_cur','-v7.3');
                    save(strcat('output\Result_sce\Sce_1_SSP1\Emis_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_cur','-v7.3');
                end
                
                %                 for yr=11:61 % from 2010 to 2060
                for yr=61 % from 2010 to 2060
                    display(yr)
                    Cocurfarm=Cocurfarm_SSP2;
                    Grid1_cur_cropCE;
                    save(strcat('output\Result_sce\Sce_1_SSP2\EC_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_cur','-v7.3');
                    save(strcat('output\Result_sce\Sce_1_SSP2\Cost_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_cur','-v7.3');
                    save(strcat('output\Result_sce\Sce_1_SSP2\Emis_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_cur','-v7.3');
                end
                
                %                 for yr=11:61 % from 2010 to 2060
                for yr=61 % from 2010 to 2060
                    display(yr)
                    Cocurfarm=Cocurfarm_SSP3;
                    Grid1_cur_cropCE;
                    save(strcat('output\Result_sce\Sce_1_SSP3\EC_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_cur','-v7.3');
                    save(strcat('output\Result_sce\Sce_1_SSP3\Cost_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_cur','-v7.3');
                    save(strcat('output\Result_sce\Sce_1_SSP3\Emis_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_cur','-v7.3');
                end
                
                %                 for yr=11:61 % from 2010 to 2060
                for yr=61 % from 2010 to 2060
                    display(yr)
                    Cocurfarm=Cocurfarm_SSP4;
                    Grid1_cur_cropCE;
                    save(strcat('output\Result_sce\Sce_1_SSP4\EC_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_cur','-v7.3');
                    save(strcat('output\Result_sce\Sce_1_SSP4\Cost_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_cur','-v7.3');
                    save(strcat('output\Result_sce\Sce_1_SSP4\Emis_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_cur','-v7.3');
                end
                
                %                 for yr=11:61 % from 2010 to 2060
                for yr=61 % from 2010 to 2060
                    display(yr)
                    Cocurfarm=Cocurfarm_SSP5;
                    Grid1_cur_cropCE;
                    save(strcat('output\Result_sce\Sce_1_SSP5\EC_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_cur','-v7.3');
                    save(strcat('output\Result_sce\Sce_1_SSP5\Cost_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_cur','-v7.3');
                    save(strcat('output\Result_sce\Sce_1_SSP5\Emis_Farm_cur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_cur','-v7.3');
                end
            end
        end
    end
end




