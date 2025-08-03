clc;
clear;
SRario=xlsread('input/crop_par', 'SRario', 'D2:D2837');


for YSSP=2
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
            rice_EF=xlsread('input/crop_par', 'EF_ric', 'C34:N64'); % 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
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
        conso_cost=xlsread('input/crop_par', 'Cost_Con', 'B3:C33')*1000/7.17; % 1:pro ID; 2:consolidation cost ($/ha);
        
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
            
            COmaize_input(idd,1:12)=repmat(maize_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
            COrice_input(idd,1:12)=repmat(rice_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
            COwheat_input(idd,1:12)=repmat(wheat_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
            COsoy_input(idd,1:12)=repmat(soy_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
            COmaize_EF(idd,1:12)=repmat(maize_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
            COrice_EF(idd,1:12)=repmat(rice_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
            COwheat_EF(idd,1:12)=repmat(wheat_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
            COsoy_EF(idd,1:12)=repmat(soy_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
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
        
        load('output\Grid001_data.dat','-mat');
        % 1:FID;2:grid area;3:CO_ID;4:surimpreous;5:protect;6:available land;7:cropland2010;8:cropland2011;9:cropland2012;10:cropland2013;11:cropland2014;12:cropland2015;13:cropland2016;14:cropland2017;
        % 15:cropland2018;16:cropland2019;17:cropland2020;18:cropland2021;19:cropland2022;20:forest;21:shrub;22:grass;23:wetland;24:cropland;25:urban;26:ice;27:barren;28:water;29:2022 sum ratio
        load('output\FCo_3yieldarea.dat','-mat');% 1:2836 COID;2:34 ProID;3:5 yield of maize,rice and wheat;6:8:area of maize,rice and wheat;9:% sum of land in each country;10:farm scale.
        
        
        for sce=2 % future farm +SSP8.5
            display(sce)
            %             for yr=27:61 % from 2026 to 2100 year
            for yr=61 % from 2026 to 2100 year
                display(yr)
                if sce==2 % further farm sce
                    RCOmaize_cost=zeros(2836,26);
                    RCOrice_cost=zeros(2836,26);
                    RCOwheat_cost=zeros(2836,26);
                    RCOsoy_cost=zeros(2836,26);
                    RCOmaize_input=zeros(2836,12);
                    RCOrice_input=zeros(2836,12);
                    RCOwheat_input=zeros(2836,12);
                    RCOsoy_input=zeros(2836,12);
                    RCOmaize_EF=zeros(2836,12);
                    RCOrice_EF=zeros(2836,12);
                    RCOwheat_EF=zeros(2836,12);
                    RCOsoy_EF=zeros(2836,12);
                    idk=find(IrrWater_par(:,7)==0);IrrWater_par(idk,7)=0.3;
                    for pro=1:31
                        idd=find(FCo_3yieldarea(:,2,1,1)==maize_cost(pro,1));
                        RCOmaize_cost(idd,1:24)=repmat(maize_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOrice_cost(idd,1:24)=repmat(rice_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOwheat_cost(idd,1:24)=repmat(wheat_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOsoy_cost(idd,1:24)=repmat(soy_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOmaize_cost(idd,11)=repmat(IrrWater_par(pro,8),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
                        RCOmaize_cost(idd,25)=repmat(IrrWater_par(pro,8),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
                        RCOrice_cost(idd,11)=repmat(IrrWater_par(pro,9),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
                        RCOrice_cost(idd,25)=repmat(IrrWater_par(pro,9),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
                        RCOwheat_cost(idd,11)=repmat(IrrWater_par(pro,10),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
                        RCOwheat_cost(idd,25)=repmat(IrrWater_par(pro,10),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
                        RCOsoy_cost(idd,11)=repmat(IrrWater_par(pro,11),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
                        RCOsoy_cost(idd,25)=repmat(IrrWater_par(pro,11),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
                        RCOmaize_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOrice_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOwheat_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOsoy_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        
                        RCOmaize_input(idd,1:12)=repmat(maize_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOrice_input(idd,1:12)=repmat(rice_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOwheat_input(idd,1:12)=repmat(wheat_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOsoy_input(idd,1:12)=repmat(soy_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        
                        RCOmaize_EF(idd,1:12)=repmat(maize_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOrice_EF(idd,1:12)=repmat(rice_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOwheat_EF(idd,1:12)=repmat(wheat_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOsoy_EF(idd,1:12)=repmat(soy_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                    end
                    
                    RCOmaize_cost(isinf(RCOmaize_cost)) =0;
                    RCOrice_cost(isinf(RCOrice_cost)) =0;
                    RCOwheat_cost(isinf(RCOwheat_cost)) =0;
                    RCOsoy_cost(isinf(RCOsoy_cost)) =0;
                    RCOmaize_input(isinf(RCOmaize_input)) =0;
                    RCOrice_input(isinf(RCOrice_input)) =0;
                    RCOwheat_input(isinf(RCOwheat_input)) =0;
                    RCOsoy_input(isinf(RCOsoy_input)) =0;
                    RCOmaize_EF(isinf(RCOmaize_EF)) =0;
                    RCOrice_EF(isinf(RCOrice_EF)) =0;
                    RCOwheat_EF(isinf(RCOwheat_EF)) =0;
                    RCOsoy_EF(isinf(RCOsoy_EF)) =0;
                    load(strcat('output\Farm_grid_SSP5\Farm_grid','-',num2str(yr+1999),'.dat'),'-mat');
                    load(strcat('output\Farm_grid_SSP5\Dfarmunit','-',num2str(yr+1999),'.dat'),'-mat');
                    ThreeCropyield=FCo_3yieldarea(:,3:6,yr,YSSP);% SSP4.5
                    ThreeCroparea=FCo_3yieldarea(:,7:10,yr,YSSP);% SSP4.5
                    if Mo_EC==1
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*0.9;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*0.9;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*0.9;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*0.9;
                    elseif Mo_EC==2
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26);
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26);
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26);
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26);
                    elseif Mo_EC==3
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*1.1;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*1.1;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*1.1;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*1.1;
                    end
                    Grid1_fur_cropCE;
                    save(strcat('output\Result_sce\Sce_2\EC_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_2\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_2\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_fur','-v7.3');
                end
            end
        end
        
        for sce=3:12
            display(sce)
            %             for yr=27:61 % from 2030 to 2060 year
            for yr=61 % from 2030 to 2060 year
                if sce==3 % future farm+enhancing fertilizer utilization efficnency
                    RCOmaize_cost=zeros(2836,26);
                    RCOrice_cost=zeros(2836,26);
                    RCOwheat_cost=zeros(2836,26);
                    RCOsoy_cost=zeros(2836,26);
                    RCOmaize_input=zeros(2836,12);
                    RCOrice_input=zeros(2836,12);
                    RCOwheat_input=zeros(2836,12);
                    RCOsoy_input=zeros(2836,12);
                    RCOmaize_EF=zeros(2836,12);
                    RCOrice_EF=zeros(2836,12);
                    RCOwheat_EF=zeros(2836,12);
                    RCOsoy_EF=zeros(2836,12);
                    idk=find(IrrWater_par(:,7)==0);IrrWater_par(idk,7)=0.3;
                    for pro=1:31
                        idd=find(FCo_3yieldarea(:,2,1,1)==maize_cost(pro,1));
                        RCOmaize_cost(idd,1:24)=repmat(maize_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOrice_cost(idd,1:24)=repmat(rice_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOwheat_cost(idd,1:24)=repmat(wheat_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOsoy_cost(idd,1:24)=repmat(soy_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOmaize_cost(idd,4)=repmat(maize_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOmaize_cost(idd,11)=repmat(IrrWater_par(pro,8),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
                        RCOmaize_cost(idd,25)=repmat(IrrWater_par(pro,8),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
                        RCOrice_cost(idd,4)=repmat(rice_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_cost(idd,11)=repmat(IrrWater_par(pro,9),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
                        RCOrice_cost(idd,25)=repmat(IrrWater_par(pro,9),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
                        RCOwheat_cost(idd,4)=repmat(wheat_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_cost(idd,11)=repmat(IrrWater_par(pro,10),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
                        RCOwheat_cost(idd,25)=repmat(IrrWater_par(pro,10),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
                        RCOsoy_cost(idd,4)=repmat(soy_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_cost(idd,11)=repmat(IrrWater_par(pro,11),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
                        RCOsoy_cost(idd,25)=repmat(IrrWater_par(pro,11),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
                        
                        RCOmaize_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOrice_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOwheat_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOsoy_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        
                        RCOmaize_input(idd,1:12)=repmat(maize_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOrice_input(idd,1:12)=repmat(rice_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOwheat_input(idd,1:12)=repmat(wheat_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOsoy_input(idd,1:12)=repmat(soy_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOmaize_input(idd,5)=repmat(maize_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_input(idd,5)=repmat(rice_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_input(idd,5)=repmat(wheat_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_input(idd,5)=repmat(soy_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOmaize_EF(idd,1:12)=repmat(maize_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOrice_EF(idd,1:12)=repmat(rice_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOwheat_EF(idd,1:12)=repmat(wheat_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOsoy_EF(idd,1:12)=repmat(soy_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                    end
                    
                    if Mo_EC==1
                        Maize_Nfer=[171 168 147 170]*0.9;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*0.9;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==2
                        Maize_Nfer=[171 168 147 170];% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143];% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==3
                        Maize_Nfer=[171 168 147 170]*1.1;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*1.1;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    end
                    
                    Co_agroecological_zones =importdata('input\Co_agroecological_zones.txt');
                    for az=1:4
                        idd1=find(Co_agroecological_zones(:,3)==az);% Maize
                        idd2=find(Co_agroecological_zones(:,4)==az);% Rice
                        idd3=find(Co_agroecological_zones(:,5)==az);% Wheat
                        
                        RCOmaize_input(idd1,4)=COmaize_input(idd1,4).*41./60;% maize Nfer usage (kg/ha) enhancing FUE
                        RCOrice_input(idd2,4)=COrice_input(idd2,4).*52./73;% rice Nfer usage (kg/ha) enhancing FUE
                        RCOwheat_input(idd3,4)=COwheat_input(idd3,4).*55./72;% wheat Nfer usage (kg/ha) enhancing FUE
                        
                        RCOmaize_cost(idd1,3)=COmaize_cost(idd1,3).*RCOmaize_input(idd1,4)./COmaize_input(idd1,4)*2.8;% maize Nfer cost ($/ha)
                        RCOrice_cost(idd2,3)=COrice_cost(idd2,3).*RCOrice_input(idd2,4)./COrice_input(idd2,4)*2.8;% rice Nfer cost ($/ha)
                        RCOwheat_cost(idd3,3)=COwheat_cost(idd3,3).*RCOwheat_input(idd3,4)./COwheat_input(idd3,4)*2.8;% wheat Nfer cost ($/ha)
                    end
                    RCOsoy_input(:,4)=RCOsoy_input(:,4).*27./43.3;% wheat Nfer usage (kg/ha) enhancing FUE (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    RCOsoy_cost(:,3)=RCOsoy_cost(:,3).*RCOwheat_input(:,4)./COwheat_input(:,4)*2.8;% wheat Nfer cost ($/ha) % consider the N fertilizer price will increased due to enhancing efficiency. (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    
                    RCOmaize_cost(isinf(RCOmaize_cost)) =0;
                    RCOrice_cost(isinf(RCOrice_cost)) =0;
                    RCOwheat_cost(isinf(RCOwheat_cost)) =0;
                    RCOsoy_cost(isinf(RCOsoy_cost)) =0;
                    RCOmaize_input(isinf(RCOmaize_input)) =0;
                    RCOrice_input(isinf(RCOrice_input)) =0;
                    RCOwheat_input(isinf(RCOwheat_input)) =0;
                    RCOsoy_input(isinf(RCOsoy_input)) =0;
                    RCOmaize_EF(isinf(RCOmaize_EF)) =0;
                    RCOrice_EF(isinf(RCOrice_EF)) =0;
                    RCOwheat_EF(isinf(RCOwheat_EF)) =0;
                    RCOsoy_EF(isinf(RCOsoy_EF)) =0;
                    
                    load(strcat('output\Farm_grid_SSP5\Farm_grid','-',num2str(yr+1999),'.dat'),'-mat');
                    load(strcat('output\Farm_grid_SSP5\Dfarmunit','-',num2str(yr+1999),'.dat'),'-mat');
                    ThreeCropyield=FCo_3yieldarea(:,3:6,yr,YSSP);% SSP4.5
                    ThreeCroparea=FCo_3yieldarea(:,7:10,yr,YSSP);% SSP4.5
                    if Mo_EC==1
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*0.9;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*0.9;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*0.9;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*0.9;
                    elseif Mo_EC==2
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26);
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26);
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26);
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26);
                    elseif Mo_EC==3
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*1.1;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*1.1;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*1.1;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*1.1;
                    end
                    
                    Grid1_fur_cropCE;
                    save(strcat('output\Result_sce\Sce_3\EC_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_3\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_3\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_fur','-v7.3');
                    
                elseif sce==4 % future farm+optimatzed fertilizer
                    RCOmaize_cost=zeros(2836,26);
                    RCOrice_cost=zeros(2836,26);
                    RCOwheat_cost=zeros(2836,26);
                    RCOsoy_cost=zeros(2836,26);
                    RCOmaize_input=zeros(2836,12);
                    RCOrice_input=zeros(2836,12);
                    RCOwheat_input=zeros(2836,12);
                    RCOsoy_input=zeros(2836,12);
                    RCOmaize_EF=zeros(2836,12);
                    RCOrice_EF=zeros(2836,12);
                    RCOwheat_EF=zeros(2836,12);
                    RCOsoy_EF=zeros(2836,12);
                    idk=find(IrrWater_par(:,7)==0);IrrWater_par(idk,7)=0.3;
                    for pro=1:31
                        idd=find(FCo_3yieldarea(:,2,1,1)==maize_cost(pro,1));
                        RCOmaize_cost(idd,1:24)=repmat(maize_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOrice_cost(idd,1:24)=repmat(rice_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOwheat_cost(idd,1:24)=repmat(wheat_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOsoy_cost(idd,1:24)=repmat(soy_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOmaize_cost(idd,4)=repmat(maize_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOmaize_cost(idd,11)=repmat(IrrWater_par(pro,8),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
                        RCOmaize_cost(idd,25)=repmat(IrrWater_par(pro,8),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
                        RCOrice_cost(idd,4)=repmat(rice_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_cost(idd,11)=repmat(IrrWater_par(pro,9),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
                        RCOrice_cost(idd,25)=repmat(IrrWater_par(pro,9),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
                        RCOwheat_cost(idd,4)=repmat(wheat_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_cost(idd,11)=repmat(IrrWater_par(pro,10),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
                        RCOwheat_cost(idd,25)=repmat(IrrWater_par(pro,10),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
                        RCOsoy_cost(idd,4)=repmat(soy_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_cost(idd,11)=repmat(IrrWater_par(pro,11),size(idd,1),1)*(0.2/2+(1-0.2))*0.2/7.17;% 10: water cost ($/ha)
                        RCOsoy_cost(idd,25)=repmat(IrrWater_par(pro,11),size(idd,1),1)*(0.2/2+(1-0.2));% water consumption (m3/ha)
                        RCOmaize_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOrice_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOwheat_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOsoy_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        
                        RCOmaize_input(idd,1:12)=repmat(maize_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOrice_input(idd,1:12)=repmat(rice_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOwheat_input(idd,1:12)=repmat(wheat_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOsoy_input(idd,1:12)=repmat(soy_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOmaize_input(idd,5)=repmat(maize_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_input(idd,5)=repmat(rice_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_input(idd,5)=repmat(wheat_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_input(idd,5)=repmat(soy_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOmaize_EF(idd,1:12)=repmat(maize_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOrice_EF(idd,1:12)=repmat(rice_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOwheat_EF(idd,1:12)=repmat(wheat_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOsoy_EF(idd,1:12)=repmat(soy_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                    end
                    
                    if Mo_EC==1
                        Maize_Nfer=[171 168 147 170]*0.9;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*0.9;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==2
                        Maize_Nfer=[171 168 147 170];% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143];% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==3
                        Maize_Nfer=[171 168 147 170]*1.1;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*1.1;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    end
                    Co_agroecological_zones =importdata('input\Co_agroecological_zones.txt');
                    for az=1:4
                        idd1=find(Co_agroecological_zones(:,3)==az);% Maize
                        idd2=find(Co_agroecological_zones(:,4)==az);% Rice
                        idd3=find(Co_agroecological_zones(:,5)==az);% Wheat
                        
                        RCOmaize_input(idd1,4)=Maize_Nfer(az)/(sum(RCOmaize_input(idd1,4).*FCo_3yieldarea(idd1,7,yr,YSSP))./sum(FCo_3yieldarea(idd1,7,yr,YSSP)))*RCOmaize_input(idd1,4);% maize Nfer usage (kg/ha)
                        RCOrice_input(idd2,4)=Rice_Nfer(az)/(sum(RCOrice_input(idd2,4).*FCo_3yieldarea(idd2,8,yr,YSSP))./sum(FCo_3yieldarea(idd2,8,yr,YSSP)))*RCOrice_input(idd2,4);% rice Nfer usage (kg/ha)
                        RCOwheat_input(idd3,4)=Wheat_Nfer(az)/(sum(RCOwheat_input(idd3,4).*FCo_3yieldarea(idd3,9,yr,YSSP))./sum(FCo_3yieldarea(idd3,9,yr,YSSP)))*RCOwheat_input(idd3,4);% wheat Nfer usage (kg/ha)
                        
                        RCOmaize_cost(idd1,3)=COmaize_cost(idd1,3).*RCOmaize_input(idd1,4)./COmaize_input(idd1,4)*2.8;% maize Nfer cost ($/ha)
                        RCOrice_cost(idd2,3)=COrice_cost(idd2,3).*RCOrice_input(idd2,4)./COrice_input(idd2,4)*2.8;% rice Nfer cost ($/ha)
                        RCOwheat_cost(idd3,3)=COwheat_cost(idd3,3).*RCOwheat_input(idd3,4)./COwheat_input(idd3,4)*2.8;% wheat Nfer cost ($/ha)
                    end
                    RCOsoy_input(:,4)=RCOsoy_input(:,4).*27./43.3;% wheat Nfer usage (kg/ha) enhancing FUE (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    RCOsoy_cost(:,3)=RCOsoy_cost(:,3).*RCOwheat_input(:,4)./COwheat_input(:,4)*2.8;% wheat Nfer cost ($/ha) % consider the N fertilizer price will increased due to enhancing efficiency. (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    
                    RCOmaize_cost(isinf(RCOmaize_cost)) =0;
                    RCOrice_cost(isinf(RCOrice_cost)) =0;
                    RCOwheat_cost(isinf(RCOwheat_cost)) =0;
                    RCOsoy_cost(isinf(RCOsoy_cost)) =0;
                    RCOmaize_input(isinf(RCOmaize_input)) =0;
                    RCOrice_input(isinf(RCOrice_input)) =0;
                    RCOwheat_input(isinf(RCOwheat_input)) =0;
                    RCOsoy_input(isinf(RCOsoy_input)) =0;
                    RCOmaize_EF(isinf(RCOmaize_EF)) =0;
                    RCOrice_EF(isinf(RCOrice_EF)) =0;
                    RCOwheat_EF(isinf(RCOwheat_EF)) =0;
                    RCOsoy_EF(isinf(RCOsoy_EF)) =0;
                    load(strcat('output\Farm_grid_SSP5\Farm_grid','-',num2str(yr+1999),'.dat'),'-mat');
                    load(strcat('output\Farm_grid_SSP5\Dfarmunit','-',num2str(yr+1999),'.dat'),'-mat');
                    ThreeCropyield=FCo_3yieldarea(:,13:16,yr,YSSP);% yield due to fertilizer
                    ThreeCroparea=FCo_3yieldarea(:,7:10,yr,YSSP);% SSP4.5
                    if Mo_EC==1
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*0.9;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*0.9;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*0.9;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*0.9;
                    elseif Mo_EC==2
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26);
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26);
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26);
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26);
                    elseif Mo_EC==3
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*1.1;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*1.1;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*1.1;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*1.1;
                    end
                    
                    Grid1_fur_cropCE;
                    save(strcat('output\Result_sce\Sce_4\EC_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_4\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_4\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_fur','-v7.3');
                    
                elseif sce==5 % future farm+optimatzed fertilizer+enhancing irrigation ratio
                    RCOmaize_cost=zeros(2836,26);
                    RCOrice_cost=zeros(2836,26);
                    RCOwheat_cost=zeros(2836,26);
                    RCOsoy_cost=zeros(2836,26);
                    
                    RCOmaize_input=zeros(2836,12);
                    RCOrice_input=zeros(2836,12);
                    RCOwheat_input=zeros(2836,12);
                    RCOsoy_input=zeros(2836,12);
                    
                    RCOmaize_EF=zeros(2836,12);
                    RCOrice_EF=zeros(2836,12);
                    RCOwheat_EF=zeros(2836,12);
                    RCOsoy_EF=zeros(2836,12);
                    idk=find(IrrWater_par(:,7)==0);IrrWater_par(idk,7)=0.3;
                    for pro=1:31
                        idd=find(FCo_3yieldarea(:,2,1,1)==maize_cost(pro,1));
                        RCOmaize_cost(idd,1:24)=repmat(maize_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOrice_cost(idd,1:24)=repmat(rice_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOwheat_cost(idd,1:24)=repmat(wheat_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOsoy_cost(idd,1:24)=repmat(soy_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOmaize_cost(idd,4)=repmat(maize_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOmaize_cost(idd,11)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2*0.2/7.17;% 10: water cost ($/ha)
                        RCOmaize_cost(idd,25)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2;% water consumption (m3/ha)
                        RCOrice_cost(idd,4)=repmat(rice_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_cost(idd,11)=repmat(IrrWater_par(pro,9),size(idd,1),1)/2*0.2/7.17;% 10: water cost ($/ha)
                        RCOrice_cost(idd,25)=repmat(IrrWater_par(pro,9),size(idd,1),1)/2;% water consumption (m3/ha)
                        RCOwheat_cost(idd,4)=repmat(wheat_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_cost(idd,11)=repmat(IrrWater_par(pro,10),size(idd,1),1)/2*0.2/7.17;% 10: water cost ($/ha)
                        RCOwheat_cost(idd,25)=repmat(IrrWater_par(pro,10),size(idd,1),1)/2;% water consumption (m3/ha)
                        RCOsoy_cost(idd,4)=repmat(soy_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_cost(idd,11)=repmat(IrrWater_par(pro,11),size(idd,1),1)/2*0.2/7.17;% 10: water cost ($/ha)
                        RCOsoy_cost(idd,25)=repmat(IrrWater_par(pro,11),size(idd,1),1)/2;% water consumption (m3/ha)
                        RCOmaize_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOrice_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOwheat_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOsoy_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        
                        RCOmaize_input(idd,1:12)=repmat(maize_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOrice_input(idd,1:12)=repmat(rice_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOwheat_input(idd,1:12)=repmat(wheat_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOsoy_input(idd,1:12)=repmat(soy_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOmaize_input(idd,5)=repmat(maize_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_input(idd,5)=repmat(rice_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_input(idd,5)=repmat(wheat_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_input(idd,5)=repmat(soy_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        
                        RCOmaize_EF(idd,1:12)=repmat(maize_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOrice_EF(idd,1:12)=repmat(rice_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOwheat_EF(idd,1:12)=repmat(wheat_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOsoy_EF(idd,1:12)=repmat(soy_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                    end
                    RCOmaize_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOrice_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOwheat_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOsoy_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    
                    if Mo_EC==1
                        Maize_Nfer=[171 168 147 170]*0.9;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*0.9;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==2
                        Maize_Nfer=[171 168 147 170];% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143];% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==3
                        Maize_Nfer=[171 168 147 170]*1.1;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*1.1;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    end
                    Co_agroecological_zones =importdata('input\Co_agroecological_zones.txt');
                    for az=1:4
                        idd1=find(Co_agroecological_zones(:,3)==az);% Maize
                        idd2=find(Co_agroecological_zones(:,4)==az);% Rice
                        idd3=find(Co_agroecological_zones(:,5)==az);% Wheat
                        
                        RCOmaize_input(idd1,4)=Maize_Nfer(az)/(sum(RCOmaize_input(idd1,4).*FCo_3yieldarea(idd1,7,yr,YSSP))./sum(FCo_3yieldarea(idd1,7,yr,YSSP)))*RCOmaize_input(idd1,4);% maize Nfer usage (kg/ha)
                        RCOrice_input(idd2,4)=Rice_Nfer(az)/(sum(RCOrice_input(idd2,4).*FCo_3yieldarea(idd2,8,yr,YSSP))./sum(FCo_3yieldarea(idd2,8,yr,YSSP)))*RCOrice_input(idd2,4);% rice Nfer usage (kg/ha)
                        RCOwheat_input(idd3,4)=Wheat_Nfer(az)/(sum(RCOwheat_input(idd3,4).*FCo_3yieldarea(idd3,9,yr,YSSP))./sum(FCo_3yieldarea(idd3,9,yr,YSSP)))*RCOwheat_input(idd3,4);% wheat Nfer usage (kg/ha)
                        
                        RCOmaize_cost(idd1,3)=COmaize_cost(idd1,3).*RCOmaize_input(idd1,4)./COmaize_input(idd1,4)*2.8;% maize Nfer cost ($/ha)
                        RCOrice_cost(idd2,3)=COrice_cost(idd2,3).*RCOrice_input(idd2,4)./COrice_input(idd2,4)*2.8;% rice Nfer cost ($/ha)
                        RCOwheat_cost(idd3,3)=COwheat_cost(idd3,3).*RCOwheat_input(idd3,4)./COwheat_input(idd3,4)*2.8;% wheat Nfer cost ($/ha)
                    end
                    RCOsoy_input(:,4)=RCOsoy_input(:,4).*27./43.3;% wheat Nfer usage (kg/ha) enhancing FUE (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    RCOsoy_cost(:,3)=RCOsoy_cost(:,3).*RCOwheat_input(:,4)./COwheat_input(:,4)*2.8;% wheat Nfer cost ($/ha) % consider the N fertilizer price will increased due to enhancing efficiency. (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    
                    RCOmaize_cost(isinf(RCOmaize_cost)) =0;
                    RCOrice_cost(isinf(RCOrice_cost)) =0;
                    RCOwheat_cost(isinf(RCOwheat_cost)) =0;
                    RCOsoy_cost(isinf(RCOsoy_cost)) =0;
                    RCOmaize_input(isinf(RCOmaize_input)) =0;
                    RCOrice_input(isinf(RCOrice_input)) =0;
                    RCOwheat_input(isinf(RCOwheat_input)) =0;
                    RCOsoy_input(isinf(RCOsoy_input)) =0;
                    RCOmaize_EF(isinf(RCOmaize_EF)) =0;
                    RCOrice_EF(isinf(RCOrice_EF)) =0;
                    RCOwheat_EF(isinf(RCOwheat_EF)) =0;
                    RCOsoy_EF(isinf(RCOsoy_EF)) =0;
                    
                    load(strcat('output\Farm_grid_SSP5\Farm_grid','-',num2str(yr+1999),'.dat'),'-mat');
                    load(strcat('output\Farm_grid_SSP5\Dfarmunit','-',num2str(yr+1999),'.dat'),'-mat');
                    ThreeCropyield=FCo_3yieldarea(:,13:16,yr,YSSP);% yield due to enhancing irrigation water
                    ThreeCroparea=FCo_3yieldarea(:,7:10,yr,YSSP);% SSP4.5
                    if Mo_EC==1
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*0.9;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*0.9;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*0.9;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*0.9;
                    elseif Mo_EC==2
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26);
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26);
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26);
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26);
                    elseif Mo_EC==3
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*1.1;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*1.1;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*1.1;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*1.1;
                    end
                    
                    Grid1_fur_cropCE;
                    save(strcat('output\Result_sce\Sce_5\EC_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_5\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_5\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_fur','-v7.3');
                    
                elseif sce==6 % future farm+optimatzed fertilizer+enhancing irrigation ratio+full irrigation
                    RCOmaize_cost=zeros(2836,26);
                    RCOrice_cost=zeros(2836,26);
                    RCOwheat_cost=zeros(2836,26);
                    RCOsoy_cost=zeros(2836,26);
                    
                    RCOmaize_input=zeros(2836,12);
                    RCOrice_input=zeros(2836,12);
                    RCOwheat_input=zeros(2836,12);
                    RCOsoy_input=zeros(2836,12);
                    
                    RCOmaize_EF=zeros(2836,12);
                    RCOrice_EF=zeros(2836,12);
                    RCOwheat_EF=zeros(2836,12);
                    RCOsoy_EF=zeros(2836,12);
                    idk=find(IrrWater_par(:,7)==0);IrrWater_par(idk,7)=0.3;
                    for pro=1:31
                        idd=find(FCo_3yieldarea(:,2,1,1)==maize_cost(pro,1));
                        RCOmaize_cost(idd,1:24)=repmat(maize_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOrice_cost(idd,1:24)=repmat(rice_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOwheat_cost(idd,1:24)=repmat(wheat_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOsoy_cost(idd,1:24)=repmat(soy_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOmaize_cost(idd,4)=repmat(maize_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOmaize_cost(idd,11)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOmaize_cost(idd,25)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOrice_cost(idd,4)=repmat(rice_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_cost(idd,11)=repmat(IrrWater_par(pro,9),size(idd,1),1)/2*0.2/7.17;% 10: water cost ($/ha)
                        RCOrice_cost(idd,25)=repmat(IrrWater_par(pro,9),size(idd,1),1)/2;% water consumption (m3/ha)
                        RCOwheat_cost(idd,4)=repmat(wheat_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_cost(idd,11)=repmat(IrrWater_par(pro,10),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOwheat_cost(idd,25)=repmat(IrrWater_par(pro,10),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOsoy_cost(idd,4)=repmat(soy_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_cost(idd,11)=repmat(IrrWater_par(pro,11),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOsoy_cost(idd,25)=repmat(IrrWater_par(pro,11),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOmaize_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOrice_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOwheat_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOsoy_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        
                        RCOmaize_input(idd,1:12)=repmat(maize_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOrice_input(idd,1:12)=repmat(rice_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOwheat_input(idd,1:12)=repmat(wheat_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOsoy_input(idd,1:12)=repmat(soy_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOmaize_input(idd,5)=repmat(maize_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_input(idd,5)=repmat(rice_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_input(idd,5)=repmat(wheat_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_input(idd,5)=repmat(soy_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        
                        RCOmaize_EF(idd,1:12)=repmat(maize_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOrice_EF(idd,1:12)=repmat(rice_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOwheat_EF(idd,1:12)=repmat(wheat_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOsoy_EF(idd,1:12)=repmat(soy_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        
                        RCOmaize_input(idd,7)=RCOmaize_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                        RCOrice_input(idd,7)=RCOrice_input(idd,7)/2;% Elect(kWh/ha)
                        RCOwheat_input(idd,7)=RCOwheat_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                        RCOsoy_input(idd,7)=RCOsoy_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                    end
                    RCOmaize_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOrice_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOwheat_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOsoy_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    
                    if Mo_EC==1
                        Maize_Nfer=[171 168 147 170]*0.9;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*0.9;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==2
                        Maize_Nfer=[171 168 147 170];% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143];% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==3
                        Maize_Nfer=[171 168 147 170]*1.1;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*1.1;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    end
                    Co_agroecological_zones =importdata('input\Co_agroecological_zones.txt');
                    for az=1:4
                        idd1=find(Co_agroecological_zones(:,3)==az);% Maize
                        idd2=find(Co_agroecological_zones(:,4)==az);% Rice
                        idd3=find(Co_agroecological_zones(:,5)==az);% Wheat
                        
                        RCOmaize_input(idd1,4)=Maize_Nfer(az)/(sum(RCOmaize_input(idd1,4).*FCo_3yieldarea(idd1,7,yr,YSSP))./sum(FCo_3yieldarea(idd1,7,yr,YSSP)))*RCOmaize_input(idd1,4);% maize Nfer usage (kg/ha)
                        RCOrice_input(idd2,4)=Rice_Nfer(az)/(sum(RCOrice_input(idd2,4).*FCo_3yieldarea(idd2,8,yr,YSSP))./sum(FCo_3yieldarea(idd2,8,yr,YSSP)))*RCOrice_input(idd2,4);% rice Nfer usage (kg/ha)
                        RCOwheat_input(idd3,4)=Wheat_Nfer(az)/(sum(RCOwheat_input(idd3,4).*FCo_3yieldarea(idd3,9,yr,YSSP))./sum(FCo_3yieldarea(idd3,9,yr,YSSP)))*RCOwheat_input(idd3,4);% wheat Nfer usage (kg/ha)
                        
                        RCOmaize_cost(idd1,3)=COmaize_cost(idd1,3).*RCOmaize_input(idd1,4)./COmaize_input(idd1,4)*2.8;% maize Nfer cost ($/ha)
                        RCOrice_cost(idd2,3)=COrice_cost(idd2,3).*RCOrice_input(idd2,4)./COrice_input(idd2,4)*2.8;% rice Nfer cost ($/ha)
                        RCOwheat_cost(idd3,3)=COwheat_cost(idd3,3).*RCOwheat_input(idd3,4)./COwheat_input(idd3,4)*2.8;% wheat Nfer cost ($/ha)
                    end
                    RCOsoy_input(:,4)=RCOsoy_input(:,4).*27./43.3;% wheat Nfer usage (kg/ha) enhancing FUE (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    RCOsoy_cost(:,3)=RCOsoy_cost(:,3).*RCOwheat_input(:,4)./COwheat_input(:,4)*2.8;% wheat Nfer cost ($/ha) % consider the N fertilizer price will increased due to enhancing efficiency. (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    
                    RCOmaize_cost(isinf(RCOmaize_cost)) =0;
                    RCOrice_cost(isinf(RCOrice_cost)) =0;
                    RCOwheat_cost(isinf(RCOwheat_cost)) =0;
                    RCOsoy_cost(isinf(RCOsoy_cost)) =0;
                    RCOmaize_input(isinf(RCOmaize_input)) =0;
                    RCOrice_input(isinf(RCOrice_input)) =0;
                    RCOwheat_input(isinf(RCOwheat_input)) =0;
                    RCOsoy_input(isinf(RCOsoy_input)) =0;
                    RCOmaize_EF(isinf(RCOmaize_EF)) =0;
                    RCOrice_EF(isinf(RCOrice_EF)) =0;
                    RCOwheat_EF(isinf(RCOwheat_EF)) =0;
                    RCOsoy_EF(isinf(RCOsoy_EF)) =0;
                    
                    load(strcat('output\Farm_grid_SSP5\Farm_grid','-',num2str(yr+1999),'.dat'),'-mat');
                    load(strcat('output\Farm_grid_SSP5\Dfarmunit','-',num2str(yr+1999),'.dat'),'-mat');
                    ThreeCropyield=FCo_3yieldarea(:,17:20,yr,YSSP);% yield due to fertilizer and full irrigation
                    ThreeCroparea=FCo_3yieldarea(:,7:10,yr,YSSP);% SSP4.5
                    if Mo_EC==1
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*0.9;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*0.9;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*0.9;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*0.9;
                    elseif Mo_EC==2
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26);
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26);
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26);
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26);
                    elseif Mo_EC==3
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*1.1;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*1.1;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*1.1;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*1.1;
                    end
                    
                    Grid1_fur_cropCE;
                    save(strcat('output\Result_sce\Sce_6\EC_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_6\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_6\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_fur','-v7.3');
                    
                elseif sce==7 % future farm+optimatzed fertilizer+enhancing irrigation ratio+full irrigation+optimized planting date
                    RCOmaize_cost=zeros(2836,26);
                    RCOrice_cost=zeros(2836,26);
                    RCOwheat_cost=zeros(2836,26);
                    RCOsoy_cost=zeros(2836,26);
                    
                    RCOmaize_input=zeros(2836,12);
                    RCOrice_input=zeros(2836,12);
                    RCOwheat_input=zeros(2836,12);
                    RCOsoy_input=zeros(2836,12);
                    
                    RCOmaize_EF=zeros(2836,12);
                    RCOrice_EF=zeros(2836,12);
                    RCOwheat_EF=zeros(2836,12);
                    RCOsoy_EF=zeros(2836,12);
                    idk=find(IrrWater_par(:,7)==0);IrrWater_par(idk,7)=0.3;
                    for pro=1:31
                        idd=find(FCo_3yieldarea(:,2,1,1)==maize_cost(pro,1));
                        RCOmaize_cost(idd,1:24)=repmat(maize_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOrice_cost(idd,1:24)=repmat(rice_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOwheat_cost(idd,1:24)=repmat(wheat_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOsoy_cost(idd,1:24)=repmat(soy_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOmaize_cost(idd,4)=repmat(maize_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOmaize_cost(idd,11)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOmaize_cost(idd,25)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOrice_cost(idd,4)=repmat(rice_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_cost(idd,11)=repmat(IrrWater_par(pro,9),size(idd,1),1)/2*0.2/7.17;% 10: water cost ($/ha)
                        RCOrice_cost(idd,25)=repmat(IrrWater_par(pro,9),size(idd,1),1)/2;% water consumption (m3/ha)
                        RCOwheat_cost(idd,4)=repmat(wheat_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_cost(idd,11)=repmat(IrrWater_par(pro,10),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOwheat_cost(idd,25)=repmat(IrrWater_par(pro,10),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOsoy_cost(idd,4)=repmat(soy_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_cost(idd,11)=repmat(IrrWater_par(pro,11),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOsoy_cost(idd,25)=repmat(IrrWater_par(pro,11),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOmaize_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOrice_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOwheat_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOsoy_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        
                        RCOmaize_input(idd,1:12)=repmat(maize_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOrice_input(idd,1:12)=repmat(rice_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOwheat_input(idd,1:12)=repmat(wheat_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOsoy_input(idd,1:12)=repmat(soy_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOmaize_input(idd,5)=repmat(maize_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_input(idd,5)=repmat(rice_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_input(idd,5)=repmat(wheat_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_input(idd,5)=repmat(soy_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        
                        RCOmaize_EF(idd,1:12)=repmat(maize_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOrice_EF(idd,1:12)=repmat(rice_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOwheat_EF(idd,1:12)=repmat(wheat_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOsoy_EF(idd,1:12)=repmat(soy_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        
                        RCOmaize_input(idd,7)=RCOmaize_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                        RCOrice_input(idd,7)=RCOrice_input(idd,7)/2;% Elect(kWh/ha)
                        RCOwheat_input(idd,7)=RCOwheat_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                        RCOsoy_input(idd,7)=RCOsoy_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                    end
                    RCOmaize_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOrice_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOwheat_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOsoy_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    
                    if Mo_EC==1
                        Maize_Nfer=[171 168 147 170]*0.9;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*0.9;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==2
                        Maize_Nfer=[171 168 147 170];% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143];% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==3
                        Maize_Nfer=[171 168 147 170]*1.1;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*1.1;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    end
                    Co_agroecological_zones =importdata('input\Co_agroecological_zones.txt');
                    for az=1:4
                        idd1=find(Co_agroecological_zones(:,3)==az);% Maize
                        idd2=find(Co_agroecological_zones(:,4)==az);% Rice
                        idd3=find(Co_agroecological_zones(:,5)==az);% Wheat
                        
                        RCOmaize_input(idd1,4)=Maize_Nfer(az)/(sum(RCOmaize_input(idd1,4).*FCo_3yieldarea(idd1,7,yr,YSSP))./sum(FCo_3yieldarea(idd1,7,yr,YSSP)))*RCOmaize_input(idd1,4);% maize Nfer usage (kg/ha)
                        RCOrice_input(idd2,4)=Rice_Nfer(az)/(sum(RCOrice_input(idd2,4).*FCo_3yieldarea(idd2,8,yr,YSSP))./sum(FCo_3yieldarea(idd2,8,yr,YSSP)))*RCOrice_input(idd2,4);% rice Nfer usage (kg/ha)
                        RCOwheat_input(idd3,4)=Wheat_Nfer(az)/(sum(RCOwheat_input(idd3,4).*FCo_3yieldarea(idd3,9,yr,YSSP))./sum(FCo_3yieldarea(idd3,9,yr,YSSP)))*RCOwheat_input(idd3,4);% wheat Nfer usage (kg/ha)
                        
                        RCOmaize_cost(idd1,3)=COmaize_cost(idd1,3).*RCOmaize_input(idd1,4)./COmaize_input(idd1,4)*2.8;% maize Nfer cost ($/ha)
                        RCOrice_cost(idd2,3)=COrice_cost(idd2,3).*RCOrice_input(idd2,4)./COrice_input(idd2,4)*2.8;% rice Nfer cost ($/ha)
                        RCOwheat_cost(idd3,3)=COwheat_cost(idd3,3).*RCOwheat_input(idd3,4)./COwheat_input(idd3,4)*2.8;% wheat Nfer cost ($/ha)
                    end
                    RCOsoy_input(:,4)=RCOsoy_input(:,4).*27./43.3;% wheat Nfer usage (kg/ha) enhancing FUE (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    RCOsoy_cost(:,3)=RCOsoy_cost(:,3).*RCOwheat_input(:,4)./COwheat_input(:,4)*2.8;% wheat Nfer cost ($/ha) % consider the N fertilizer price will increased due to enhancing efficiency. (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    
                    RCOmaize_cost(isinf(RCOmaize_cost)) =0;
                    RCOrice_cost(isinf(RCOrice_cost)) =0;
                    RCOwheat_cost(isinf(RCOwheat_cost)) =0;
                    RCOsoy_cost(isinf(RCOsoy_cost)) =0;
                    RCOmaize_input(isinf(RCOmaize_input)) =0;
                    RCOrice_input(isinf(RCOrice_input)) =0;
                    RCOwheat_input(isinf(RCOwheat_input)) =0;
                    RCOsoy_input(isinf(RCOsoy_input)) =0;
                    RCOmaize_EF(isinf(RCOmaize_EF)) =0;
                    RCOrice_EF(isinf(RCOrice_EF)) =0;
                    RCOwheat_EF(isinf(RCOwheat_EF)) =0;
                    RCOsoy_EF(isinf(RCOsoy_EF)) =0;
                    
                    load(strcat('output\Farm_grid_SSP5\Farm_grid','-',num2str(yr+1999),'.dat'),'-mat');
                    load(strcat('output\Farm_grid_SSP5\Dfarmunit','-',num2str(yr+1999),'.dat'),'-mat');
                    ThreeCropyield=FCo_3yieldarea(:,21:24,yr,YSSP);% yield due to fertilizer and full irrigation and planting date
                    ThreeCroparea=FCo_3yieldarea(:,7:10,yr,YSSP);% SSP4.5
                    if Mo_EC==1
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*0.9;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*0.9;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*0.9;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*0.9;
                    elseif Mo_EC==2
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26);
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26);
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26);
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26);
                    elseif Mo_EC==3
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*1.1;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*1.1;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*1.1;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*1.1;
                    end
                    
                    Grid1_fur_cropCE;
                    save(strcat('output\Result_sce\Sce_7\EC_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_7\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_7\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_fur','-v7.3');
                    
                elseif sce==8 % future farm+optimatzed fertilizer+enhancing irrigation ratio+full irrigation+optimized planting date+d plant density
                    RCOmaize_cost=zeros(2836,26);
                    RCOrice_cost=zeros(2836,26);
                    RCOwheat_cost=zeros(2836,26);
                    RCOsoy_cost=zeros(2836,26);
                    
                    RCOmaize_input=zeros(2836,12);
                    RCOrice_input=zeros(2836,12);
                    RCOwheat_input=zeros(2836,12);
                    RCOsoy_input=zeros(2836,12);
                    
                    RCOmaize_EF=zeros(2836,12);
                    RCOrice_EF=zeros(2836,12);
                    RCOwheat_EF=zeros(2836,12);
                    RCOsoy_EF=zeros(2836,12);
                    idk=find(IrrWater_par(:,7)==0);IrrWater_par(idk,7)=0.3;
                    for pro=1:31
                        idd=find(FCo_3yieldarea(:,2,1,1)==maize_cost(pro,1));
                        RCOmaize_cost(idd,1:24)=repmat(maize_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOrice_cost(idd,1:24)=repmat(rice_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOwheat_cost(idd,1:24)=repmat(wheat_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOsoy_cost(idd,1:24)=repmat(soy_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOmaize_cost(idd,4)=repmat(maize_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOmaize_cost(idd,11)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOmaize_cost(idd,25)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOrice_cost(idd,4)=repmat(rice_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_cost(idd,11)=repmat(IrrWater_par(pro,9),size(idd,1),1)/2*0.2/7.17;% 10: water cost ($/ha)
                        RCOrice_cost(idd,25)=repmat(IrrWater_par(pro,9),size(idd,1),1)/2;% water consumption (m3/ha)
                        RCOwheat_cost(idd,4)=repmat(wheat_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_cost(idd,11)=repmat(IrrWater_par(pro,10),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOwheat_cost(idd,25)=repmat(IrrWater_par(pro,10),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOsoy_cost(idd,4)=repmat(soy_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_cost(idd,11)=repmat(IrrWater_par(pro,11),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOsoy_cost(idd,25)=repmat(IrrWater_par(pro,11),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOmaize_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOrice_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOwheat_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOsoy_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        
                        RCOmaize_input(idd,1:12)=repmat(maize_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOrice_input(idd,1:12)=repmat(rice_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOwheat_input(idd,1:12)=repmat(wheat_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOsoy_input(idd,1:12)=repmat(soy_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOmaize_input(idd,5)=repmat(maize_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_input(idd,5)=repmat(rice_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_input(idd,5)=repmat(wheat_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_input(idd,5)=repmat(soy_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        
                        RCOmaize_EF(idd,1:12)=repmat(maize_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOrice_EF(idd,1:12)=repmat(rice_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOwheat_EF(idd,1:12)=repmat(wheat_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOsoy_EF(idd,1:12)=repmat(soy_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        
                        RCOmaize_input(idd,7)=RCOmaize_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                        RCOrice_input(idd,7)=RCOrice_input(idd,7)/2;% Elect(kWh/ha)
                        RCOwheat_input(idd,7)=RCOwheat_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                        RCOsoy_input(idd,7)=RCOsoy_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                    end
                    RCOmaize_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOrice_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOwheat_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOsoy_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    
                    RCOmaize_cost(:,2)=RCOmaize_cost(:,2).*(1+(FCo_3yieldarea(:,25,yr,YSSP)-FCo_3yieldarea(:,21,yr,YSSP))./FCo_3yieldarea(:,21,yr,YSSP));
                    RCOrice_cost(:,2)=RCOrice_cost(:,2).*(1+(FCo_3yieldarea(:,26,yr,YSSP)-FCo_3yieldarea(:,22,yr,YSSP))./FCo_3yieldarea(:,22,yr,YSSP));
                    RCOwheat_cost(:,2)=RCOwheat_cost(:,2).*(1+(FCo_3yieldarea(:,27,yr,YSSP)-FCo_3yieldarea(:,23,yr,YSSP))./FCo_3yieldarea(:,23,yr,YSSP));
                    RCOsoy_cost(:,2)=RCOsoy_cost(:,2).*(1+(FCo_3yieldarea(:,28,yr,YSSP)-FCo_3yieldarea(:,24,yr,YSSP))./FCo_3yieldarea(:,24,yr,YSSP));
                    
                    if Mo_EC==1
                        Maize_Nfer=[171 168 147 170]*0.9;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*0.9;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==2
                        Maize_Nfer=[171 168 147 170];% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143];% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==3
                        Maize_Nfer=[171 168 147 170]*1.1;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*1.1;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    end
                    Co_agroecological_zones =importdata('input\Co_agroecological_zones.txt');
                    for az=1:4
                        idd1=find(Co_agroecological_zones(:,3)==az);% Maize
                        idd2=find(Co_agroecological_zones(:,4)==az);% Rice
                        idd3=find(Co_agroecological_zones(:,5)==az);% Wheat
                        
                        RCOmaize_input(idd1,4)=Maize_Nfer(az)/(sum(RCOmaize_input(idd1,4).*FCo_3yieldarea(idd1,7,yr,YSSP))./sum(FCo_3yieldarea(idd1,7,yr,YSSP)))*RCOmaize_input(idd1,4);% maize Nfer usage (kg/ha)
                        RCOrice_input(idd2,4)=Rice_Nfer(az)/(sum(RCOrice_input(idd2,4).*FCo_3yieldarea(idd2,8,yr,YSSP))./sum(FCo_3yieldarea(idd2,8,yr,YSSP)))*RCOrice_input(idd2,4);% rice Nfer usage (kg/ha)
                        RCOwheat_input(idd3,4)=Wheat_Nfer(az)/(sum(RCOwheat_input(idd3,4).*FCo_3yieldarea(idd3,9,yr,YSSP))./sum(FCo_3yieldarea(idd3,9,yr,YSSP)))*RCOwheat_input(idd3,4);% wheat Nfer usage (kg/ha)
                        
                        RCOmaize_cost(idd1,3)=COmaize_cost(idd1,3).*RCOmaize_input(idd1,4)./COmaize_input(idd1,4)*2.8;% maize Nfer cost ($/ha)
                        RCOrice_cost(idd2,3)=COrice_cost(idd2,3).*RCOrice_input(idd2,4)./COrice_input(idd2,4)*2.8;% rice Nfer cost ($/ha)
                        RCOwheat_cost(idd3,3)=COwheat_cost(idd3,3).*RCOwheat_input(idd3,4)./COwheat_input(idd3,4)*2.8;% wheat Nfer cost ($/ha)
                    end
                    RCOsoy_input(:,4)=RCOsoy_input(:,4).*27./43.3;% wheat Nfer usage (kg/ha) enhancing FUE (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    RCOsoy_cost(:,3)=RCOsoy_cost(:,3).*RCOwheat_input(:,4)./COwheat_input(:,4)*2.8;% wheat Nfer cost ($/ha) % consider the N fertilizer price will increased due to enhancing efficiency. (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    
                    RCOmaize_cost(isinf(RCOmaize_cost)) =0;
                    RCOrice_cost(isinf(RCOrice_cost)) =0;
                    RCOwheat_cost(isinf(RCOwheat_cost)) =0;
                    RCOsoy_cost(isinf(RCOsoy_cost)) =0;
                    RCOmaize_input(isinf(RCOmaize_input)) =0;
                    RCOrice_input(isinf(RCOrice_input)) =0;
                    RCOwheat_input(isinf(RCOwheat_input)) =0;
                    RCOsoy_input(isinf(RCOsoy_input)) =0;
                    RCOmaize_EF(isinf(RCOmaize_EF)) =0;
                    RCOrice_EF(isinf(RCOrice_EF)) =0;
                    RCOwheat_EF(isinf(RCOwheat_EF)) =0;
                    RCOsoy_EF(isinf(RCOsoy_EF)) =0;
                    
                    load(strcat('output\Farm_grid_SSP5\Farm_grid','-',num2str(yr+1999),'.dat'),'-mat');
                    load(strcat('output\Farm_grid_SSP5\Dfarmunit','-',num2str(yr+1999),'.dat'),'-mat');
                    ThreeCropyield=FCo_3yieldarea(:,25:28,yr,YSSP);% yield due to fertilizer and full irrigation and planting date and plant density
                    ThreeCroparea=FCo_3yieldarea(:,7:10,yr,YSSP);% SSP4.5
                    if Mo_EC==1
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*0.9;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*0.9;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*0.9;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*0.9;
                    elseif Mo_EC==2
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26);
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26);
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26);
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26);
                    elseif Mo_EC==3
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*1.1;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*1.1;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*1.1;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*1.1;
                    end
                    Grid1_fur_cropCE;
                    save(strcat('output\Result_sce\Sce_8\EC_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_8\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_8\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_fur','-v7.3');
                    
                elseif sce==9 % future farm+optimatzed fertilizer+enhancing irrigation ratio+full irrigation+optimized planting date+d plant density+soil organic management
                    RCOmaize_cost=zeros(2836,26);
                    RCOrice_cost=zeros(2836,26);
                    RCOwheat_cost=zeros(2836,26);
                    RCOsoy_cost=zeros(2836,26);
                    
                    RCOmaize_input=zeros(2836,12);
                    RCOrice_input=zeros(2836,12);
                    RCOwheat_input=zeros(2836,12);
                    RCOsoy_input=zeros(2836,12);
                    
                    RCOmaize_EF=zeros(2836,12);
                    RCOrice_EF=zeros(2836,12);
                    RCOwheat_EF=zeros(2836,12);
                    RCOsoy_EF=zeros(2836,12);
                    idk=find(IrrWater_par(:,7)==0);IrrWater_par(idk,7)=0.3;
                    for pro=1:31
                        idd=find(FCo_3yieldarea(:,2,1,1)==maize_cost(pro,1));
                        RCOmaize_cost(idd,1:24)=repmat(maize_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOrice_cost(idd,1:24)=repmat(rice_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOwheat_cost(idd,1:24)=repmat(wheat_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOsoy_cost(idd,1:24)=repmat(soy_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOmaize_cost(idd,4)=repmat(maize_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOmaize_cost(idd,11)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOmaize_cost(idd,25)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOrice_cost(idd,4)=repmat(rice_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_cost(idd,11)=repmat(IrrWater_par(pro,9),size(idd,1),1)/2*0.2/7.17;% 10: water cost ($/ha)
                        RCOrice_cost(idd,25)=repmat(IrrWater_par(pro,9),size(idd,1),1)/2;% water consumption (m3/ha)
                        RCOwheat_cost(idd,4)=repmat(wheat_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_cost(idd,11)=repmat(IrrWater_par(pro,10),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOwheat_cost(idd,25)=repmat(IrrWater_par(pro,10),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOsoy_cost(idd,4)=repmat(soy_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_cost(idd,11)=repmat(IrrWater_par(pro,11),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOsoy_cost(idd,25)=repmat(IrrWater_par(pro,11),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOmaize_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOrice_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOwheat_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOsoy_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        
                        RCOmaize_input(idd,1:12)=repmat(maize_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOrice_input(idd,1:12)=repmat(rice_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOwheat_input(idd,1:12)=repmat(wheat_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOsoy_input(idd,1:12)=repmat(soy_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOmaize_input(idd,5)=repmat(maize_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_input(idd,5)=repmat(rice_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_input(idd,5)=repmat(wheat_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_input(idd,5)=repmat(soy_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        
                        RCOmaize_EF(idd,1:12)=repmat(maize_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOrice_EF(idd,1:12)=repmat(rice_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOwheat_EF(idd,1:12)=repmat(wheat_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOsoy_EF(idd,1:12)=repmat(soy_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        
                        RCOmaize_input(idd,7)=RCOmaize_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                        RCOrice_input(idd,7)=RCOrice_input(idd,7)/2;% Elect(kWh/ha)
                        RCOwheat_input(idd,7)=RCOwheat_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                        RCOsoy_input(idd,7)=RCOsoy_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                    end
                    RCOmaize_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOrice_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOwheat_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOsoy_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    
                    RCOmaize_cost(:,2)=RCOmaize_cost(:,2).*(1+(FCo_3yieldarea(:,25,yr,YSSP)-FCo_3yieldarea(:,21,yr,YSSP))./FCo_3yieldarea(:,21,yr,YSSP));
                    RCOrice_cost(:,2)=RCOrice_cost(:,2).*(1+(FCo_3yieldarea(:,26,yr,YSSP)-FCo_3yieldarea(:,22,yr,YSSP))./FCo_3yieldarea(:,22,yr,YSSP));
                    RCOwheat_cost(:,2)=RCOwheat_cost(:,2).*(1+(FCo_3yieldarea(:,27,yr,YSSP)-FCo_3yieldarea(:,23,yr,YSSP))./FCo_3yieldarea(:,23,yr,YSSP));
                    RCOsoy_cost(:,2)=RCOsoy_cost(:,2).*(1+(FCo_3yieldarea(:,28,yr,YSSP)-FCo_3yieldarea(:,24,yr,YSSP))./FCo_3yieldarea(:,24,yr,YSSP));
                    
                    if Mo_EC==1
                        Maize_Nfer=[171 168 147 170]*0.9;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*0.9;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==2
                        Maize_Nfer=[171 168 147 170];% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143];% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==3
                        Maize_Nfer=[171 168 147 170]*1.1;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*1.1;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    end
                    Co_agroecological_zones =importdata('input\Co_agroecological_zones.txt');
                    for az=1:4
                        idd1=find(Co_agroecological_zones(:,3)==az);% Maize
                        idd2=find(Co_agroecological_zones(:,4)==az);% Rice
                        idd3=find(Co_agroecological_zones(:,5)==az);% Wheat
                        
                        RCOmaize_input(idd1,4)=Maize_Nfer(az)/(sum(RCOmaize_input(idd1,4).*FCo_3yieldarea(idd1,7,yr,YSSP))./sum(FCo_3yieldarea(idd1,7,yr,YSSP)))*RCOmaize_input(idd1,4);% maize Nfer usage (kg/ha)
                        RCOrice_input(idd2,4)=Rice_Nfer(az)/(sum(RCOrice_input(idd2,4).*FCo_3yieldarea(idd2,8,yr,YSSP))./sum(FCo_3yieldarea(idd2,8,yr,YSSP)))*RCOrice_input(idd2,4);% rice Nfer usage (kg/ha)
                        RCOwheat_input(idd3,4)=Wheat_Nfer(az)/(sum(RCOwheat_input(idd3,4).*FCo_3yieldarea(idd3,9,yr,YSSP))./sum(FCo_3yieldarea(idd3,9,yr,YSSP)))*RCOwheat_input(idd3,4);% wheat Nfer usage (kg/ha)
                        
                        RCOmaize_cost(idd1,3)=COmaize_cost(idd1,3).*RCOmaize_input(idd1,4)./COmaize_input(idd1,4)*2.8;% maize Nfer cost ($/ha)
                        RCOrice_cost(idd2,3)=COrice_cost(idd2,3).*RCOrice_input(idd2,4)./COrice_input(idd2,4)*2.8;% rice Nfer cost ($/ha)
                        RCOwheat_cost(idd3,3)=COwheat_cost(idd3,3).*RCOwheat_input(idd3,4)./COwheat_input(idd3,4)*2.8;% wheat Nfer cost ($/ha)
                    end
                    RCOsoy_input(:,4)=RCOsoy_input(:,4).*27./43.3;% wheat Nfer usage (kg/ha) enhancing FUE (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    RCOsoy_cost(:,3)=RCOsoy_cost(:,3).*RCOwheat_input(:,4)./COwheat_input(:,4)*2.8;% wheat Nfer cost ($/ha) % consider the N fertilizer price will increased due to enhancing efficiency. (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    
                    RCOmaize_cost(isinf(RCOmaize_cost)) =0;
                    RCOrice_cost(isinf(RCOrice_cost)) =0;
                    RCOwheat_cost(isinf(RCOwheat_cost)) =0;
                    RCOsoy_cost(isinf(RCOsoy_cost)) =0;
                    RCOmaize_input(isinf(RCOmaize_input)) =0;
                    RCOrice_input(isinf(RCOrice_input)) =0;
                    RCOwheat_input(isinf(RCOwheat_input)) =0;
                    RCOsoy_input(isinf(RCOsoy_input)) =0;
                    RCOmaize_EF(isinf(RCOmaize_EF)) =0;
                    RCOrice_EF(isinf(RCOrice_EF)) =0;
                    RCOwheat_EF(isinf(RCOwheat_EF)) =0;
                    RCOsoy_EF(isinf(RCOsoy_EF)) =0;
                    
                    load(strcat('output\Farm_grid_SSP5\Farm_grid','-',num2str(yr+1999),'.dat'),'-mat');
                    load(strcat('output\Farm_grid_SSP5\Dfarmunit','-',num2str(yr+1999),'.dat'),'-mat');
                    ThreeCropyield=FCo_3yieldarea(:,29:32,yr,YSSP);% yield due to fertilizer and full irrigation and planting date and plant density+soil organic management
                    ThreeCroparea=FCo_3yieldarea(:,7:10,yr,YSSP);% SSP4.5
                    if Mo_EC==1
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*0.9;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*0.9;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*0.9;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*0.9;
                    elseif Mo_EC==2
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26);
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26);
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26);
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26);
                    elseif Mo_EC==3
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*1.1;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*1.1;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*1.1;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*1.1;
                    end
                    
                    Grid1_fur_cropCE;
                    save(strcat('output\Result_sce\Sce_9\EC_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_9\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_9\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_fur','-v7.3');
                    
                elseif sce==10 % future farm+optimatzed fertilizer+enhancing irrigation ratio+full irrigation+optimized planting date+d plant density+soil organic management+cultivar
                    RCOmaize_cost=zeros(2836,26);
                    RCOrice_cost=zeros(2836,26);
                    RCOwheat_cost=zeros(2836,26);
                    RCOsoy_cost=zeros(2836,26);
                    
                    RCOmaize_input=zeros(2836,12);
                    RCOrice_input=zeros(2836,12);
                    RCOwheat_input=zeros(2836,12);
                    RCOsoy_input=zeros(2836,12);
                    
                    RCOmaize_EF=zeros(2836,12);
                    RCOrice_EF=zeros(2836,12);
                    RCOwheat_EF=zeros(2836,12);
                    RCOsoy_EF=zeros(2836,12);
                    idk=find(IrrWater_par(:,7)==0);IrrWater_par(idk,7)=0.3;
                    for pro=1:31
                        idd=find(FCo_3yieldarea(:,2,1,1)==maize_cost(pro,1));
                        RCOmaize_cost(idd,1:24)=repmat(maize_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOrice_cost(idd,1:24)=repmat(rice_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOwheat_cost(idd,1:24)=repmat(wheat_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOsoy_cost(idd,1:24)=repmat(soy_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOmaize_cost(idd,4)=repmat(maize_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOmaize_cost(idd,11)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOmaize_cost(idd,25)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOrice_cost(idd,4)=repmat(rice_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_cost(idd,11)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2*0.2/7.17;% 10: water cost ($/ha)
                        RCOrice_cost(idd,25)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2;% water consumption (m3/ha)
                        RCOwheat_cost(idd,4)=repmat(wheat_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_cost(idd,11)=repmat(IrrWater_par(pro,10),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOwheat_cost(idd,25)=repmat(IrrWater_par(pro,10),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOsoy_cost(idd,4)=repmat(soy_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_cost(idd,11)=repmat(IrrWater_par(pro,11),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOsoy_cost(idd,25)=repmat(IrrWater_par(pro,11),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOmaize_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOrice_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOwheat_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOsoy_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        
                        RCOmaize_input(idd,1:12)=repmat(maize_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOrice_input(idd,1:12)=repmat(rice_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOwheat_input(idd,1:12)=repmat(wheat_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOsoy_input(idd,1:12)=repmat(soy_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOmaize_input(idd,5)=repmat(maize_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_input(idd,5)=repmat(rice_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_input(idd,5)=repmat(wheat_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_input(idd,5)=repmat(soy_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        
                        RCOmaize_EF(idd,1:12)=repmat(maize_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOrice_EF(idd,1:12)=repmat(rice_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOwheat_EF(idd,1:12)=repmat(wheat_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOsoy_EF(idd,1:12)=repmat(soy_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        
                        RCOmaize_input(idd,7)=RCOmaize_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                        RCOrice_input(idd,7)=RCOrice_input(idd,7)/2;% Elect(kWh/ha)
                        RCOwheat_input(idd,7)=RCOwheat_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                        RCOsoy_input(idd,7)=RCOsoy_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                    end
                    RCOmaize_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOrice_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOwheat_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOsoy_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    
                    RCOmaize_cost(:,2)=RCOmaize_cost(:,2).*(1+(FCo_3yieldarea(:,25,yr,YSSP)-FCo_3yieldarea(:,21,yr,YSSP))./FCo_3yieldarea(:,21,yr,YSSP));
                    RCOrice_cost(:,2)=RCOrice_cost(:,2).*(1+(FCo_3yieldarea(:,26,yr,YSSP)-FCo_3yieldarea(:,22,yr,YSSP))./FCo_3yieldarea(:,22,yr,YSSP));
                    RCOwheat_cost(:,2)=RCOwheat_cost(:,2).*(1+(FCo_3yieldarea(:,27,yr,YSSP)-FCo_3yieldarea(:,23,yr,YSSP))./FCo_3yieldarea(:,23,yr,YSSP));
                    RCOsoy_cost(:,2)=RCOsoy_cost(:,2).*(1+(FCo_3yieldarea(:,28,yr,YSSP)-FCo_3yieldarea(:,24,yr,YSSP))./FCo_3yieldarea(:,24,yr,YSSP));
                    
                    if Mo_EC==1
                        Maize_Nfer=[171 168 147 170]*0.9;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*0.9;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==2
                        Maize_Nfer=[171 168 147 170];% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143];% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==3
                        Maize_Nfer=[171 168 147 170]*1.1;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*1.1;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    end
                    Co_agroecological_zones =importdata('input\Co_agroecological_zones.txt');
                    for az=1:4
                        idd1=find(Co_agroecological_zones(:,3)==az);% Maize
                        idd2=find(Co_agroecological_zones(:,4)==az);% Rice
                        idd3=find(Co_agroecological_zones(:,5)==az);% Wheat
                        
                        RCOmaize_input(idd1,4)=Maize_Nfer(az)/(sum(RCOmaize_input(idd1,4).*FCo_3yieldarea(idd1,7,yr,YSSP))./sum(FCo_3yieldarea(idd1,7,yr,YSSP)))*RCOmaize_input(idd1,4);% maize Nfer usage (kg/ha)
                        RCOrice_input(idd2,4)=Rice_Nfer(az)/(sum(RCOrice_input(idd2,4).*FCo_3yieldarea(idd2,8,yr,YSSP))./sum(FCo_3yieldarea(idd2,8,yr,YSSP)))*RCOrice_input(idd2,4);% rice Nfer usage (kg/ha)
                        RCOwheat_input(idd3,4)=Wheat_Nfer(az)/(sum(RCOwheat_input(idd3,4).*FCo_3yieldarea(idd3,9,yr,YSSP))./sum(FCo_3yieldarea(idd3,9,yr,YSSP)))*RCOwheat_input(idd3,4);% wheat Nfer usage (kg/ha)
                        
                        RCOmaize_cost(idd1,3)=COmaize_cost(idd1,3).*RCOmaize_input(idd1,4)./COmaize_input(idd1,4)*2.8;% maize Nfer cost ($/ha)
                        RCOrice_cost(idd2,3)=COrice_cost(idd2,3).*RCOrice_input(idd2,4)./COrice_input(idd2,4)*2.8;% rice Nfer cost ($/ha)
                        RCOwheat_cost(idd3,3)=COwheat_cost(idd3,3).*RCOwheat_input(idd3,4)./COwheat_input(idd3,4)*2.8;% wheat Nfer cost ($/ha)
                    end
                    
                    RCOsoy_input(:,4)=RCOsoy_input(:,4).*27./43.3;% wheat Nfer usage (kg/ha) enhancing FUE (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    RCOsoy_cost(:,3)=RCOsoy_cost(:,3).*RCOwheat_input(:,4)./COwheat_input(:,4)*2.8;% wheat Nfer cost ($/ha) % consider the N fertilizer price will increased due to enhancing efficiency. (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    
                    RCOmaize_cost(isinf(RCOmaize_cost)) =0;
                    RCOrice_cost(isinf(RCOrice_cost)) =0;
                    RCOwheat_cost(isinf(RCOwheat_cost)) =0;
                    RCOsoy_cost(isinf(RCOsoy_cost)) =0;
                    RCOmaize_input(isinf(RCOmaize_input)) =0;
                    RCOrice_input(isinf(RCOrice_input)) =0;
                    RCOwheat_input(isinf(RCOwheat_input)) =0;
                    RCOsoy_input(isinf(RCOsoy_input)) =0;
                    RCOmaize_EF(isinf(RCOmaize_EF)) =0;
                    RCOrice_EF(isinf(RCOrice_EF)) =0;
                    RCOwheat_EF(isinf(RCOwheat_EF)) =0;
                    RCOsoy_EF(isinf(RCOsoy_EF)) =0;
                    
                    load(strcat('output\Farm_grid_SSP5\Farm_grid','-',num2str(yr+1999),'.dat'),'-mat');
                    load(strcat('output\Farm_grid_SSP5\Dfarmunit','-',num2str(yr+1999),'.dat'),'-mat');
                    ThreeCropyield=FCo_3yieldarea(:,33:36,yr,YSSP);% yield due to fertilizer and full irrigation and planting date and plant density+soil organic management+cultivar
                    ThreeCroparea=FCo_3yieldarea(:,7:10,yr,YSSP);% SSP4.5
                    if Mo_EC==1
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*0.9;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*0.9;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*0.9;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*0.9;
                    elseif Mo_EC==2
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26);
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26);
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26);
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26);
                    elseif Mo_EC==3
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*1.1;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*1.1;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*1.1;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*1.1;
                    end
                    
                    Grid1_fur_cropCE;
                    save(strcat('output\Result_sce\Sce_10\EC_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_10\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_10\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_fur','-v7.3');
                    
                elseif sce==11 % future farm+SSP4.5+optimatzed fertilizer+optimized planting date+optimized plant density+soil organic management+optimized cultivar+full irrigation+mutiple cropping
                    RCOmaize_cost=zeros(2836,26);
                    RCOrice_cost=zeros(2836,26);
                    RCOwheat_cost=zeros(2836,26);
                    RCOsoy_cost=zeros(2836,26);
                    
                    RCOmaize_input=zeros(2836,12);
                    RCOrice_input=zeros(2836,12);
                    RCOwheat_input=zeros(2836,12);
                    RCOsoy_input=zeros(2836,12);
                    
                    RCOmaize_EF=zeros(2836,12);
                    RCOrice_EF=zeros(2836,12);
                    RCOwheat_EF=zeros(2836,12);
                    RCOsoy_EF=zeros(2836,12);
                    idk=find(IrrWater_par(:,7)==0);IrrWater_par(idk,7)=0.3;
                    for pro=1:31
                        idd=find(FCo_3yieldarea(:,2,1,1)==maize_cost(pro,1));
                        RCOmaize_cost(idd,1:24)=repmat(maize_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOrice_cost(idd,1:24)=repmat(rice_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOwheat_cost(idd,1:24)=repmat(wheat_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOsoy_cost(idd,1:24)=repmat(soy_cost(pro,1:24),size(idd,1),1);% 1:pro ID; 3:N fer; 4:P fer; 9 mach cost; 10:rent water machine 11: water 13: labor cost (yuan/亩);
                        RCOmaize_cost(idd,4)=repmat(maize_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOmaize_cost(idd,11)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOmaize_cost(idd,25)=repmat(IrrWater_par(pro,8),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOrice_cost(idd,4)=repmat(rice_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_cost(idd,11)=repmat(IrrWater_par(pro,9),size(idd,1),1)/2*0.2/7.17;% 10: water cost ($/ha)
                        RCOrice_cost(idd,25)=repmat(IrrWater_par(pro,9),size(idd,1),1)/2;% water consumption (m3/ha)
                        RCOwheat_cost(idd,4)=repmat(wheat_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_cost(idd,11)=repmat(IrrWater_par(pro,10),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOwheat_cost(idd,25)=repmat(IrrWater_par(pro,10),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOsoy_cost(idd,4)=repmat(soy_cost(pro,4),size(idd,1),1)*3.3/7.2;% P fertilizer cost (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_cost(idd,11)=repmat(IrrWater_par(pro,11),size(idd,1),1)/2/IrrWater_par(pro,7)*0.2/7.17;% 10: water cost ($/ha)
                        RCOsoy_cost(idd,25)=repmat(IrrWater_par(pro,11),size(idd,1),1)/2/IrrWater_par(pro,7);% water consumption (m3/ha)
                        RCOmaize_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOrice_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOwheat_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        RCOsoy_cost(idd,26)=repmat(conso_cost(pro,2),size(idd,1),1);% consolidation cost $/ha
                        
                        RCOmaize_input(idd,1:12)=repmat(maize_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOrice_input(idd,1:12)=repmat(rice_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOwheat_input(idd,1:12)=repmat(wheat_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOsoy_input(idd,1:12)=repmat(soy_input(pro,1:12),size(idd,1),1);% 1:pro ID; 4:6; N,P,K fer (kg/ha);7:Elect(kWh/ha);8:Diesel(kg/ha);9:Gasline(kg/ha);10:plastic film (kg/ha);11:seed (kg/ha);12:pesticide (kg/ha)
                        RCOmaize_input(idd,5)=repmat(maize_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOrice_input(idd,5)=repmat(rice_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOwheat_input(idd,5)=repmat(wheat_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        RCOsoy_input(idd,5)=repmat(soy_input(pro,5),size(idd,1),1)*3.3/7.2;% P fertilizer input (Zou, T., Zhang, X., & Davidson, E. A. (2022). Global trends of cropland phosphorus use and sustainability challenges. Nature, 611(7934), 81-87.)
                        
                        RCOmaize_EF(idd,1:12)=repmat(maize_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOrice_EF(idd,1:12)=repmat(rice_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOwheat_EF(idd,1:12)=repmat(wheat_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        RCOsoy_EF(idd,1:12)=repmat(soy_EF(pro,1:12),size(idd,1),1);% 1:pro ID; 2:4; N,P,K fer (kg CO₂e kg-1);5:Elect(kg CO₂e kg-1);6:Diesel(kg CO₂e kg-1);7:Gasline(kg CO₂e kg-1);8:plastic film (kg CO₂e kg-1);9:seed (kg CO₂e kg-1);10:pesticide (kg CO₂e kg-1);11:CH4 (kg CH4/ha);12:Field fer N2O (N2O-N%)
                        
                        RCOmaize_input(idd,7)=RCOmaize_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                        RCOrice_input(idd,7)=RCOrice_input(idd,7)/2;% Elect(kWh/ha)
                        RCOwheat_input(idd,7)=RCOwheat_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                        RCOsoy_input(idd,7)=RCOsoy_input(idd,7)/2/IrrWater_par(pro,7);% Elect(kWh/ha)
                    end
                    RCOmaize_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOrice_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOwheat_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    RCOsoy_cost(:,10)=2500/7.17;% rent water machine ($/ha) [中国节水灌溉工程投资对农业、经济与环境的影响模拟分析研究-2023]
                    
                    RCOmaize_cost(:,2)=RCOmaize_cost(:,2).*(1+(FCo_3yieldarea(:,25,yr,YSSP)-FCo_3yieldarea(:,21,yr,YSSP))./FCo_3yieldarea(:,21,yr,YSSP));
                    RCOrice_cost(:,2)=RCOrice_cost(:,2).*(1+(FCo_3yieldarea(:,26,yr,YSSP)-FCo_3yieldarea(:,22,yr,YSSP))./FCo_3yieldarea(:,22,yr,YSSP));
                    RCOwheat_cost(:,2)=RCOwheat_cost(:,2).*(1+(FCo_3yieldarea(:,27,yr,YSSP)-FCo_3yieldarea(:,23,yr,YSSP))./FCo_3yieldarea(:,23,yr,YSSP));
                    RCOsoy_cost(:,2)=RCOsoy_cost(:,2).*(1+(FCo_3yieldarea(:,28,yr,YSSP)-FCo_3yieldarea(:,24,yr,YSSP))./FCo_3yieldarea(:,24,yr,YSSP));
                    
                    if Mo_EC==1
                        Maize_Nfer=[171 168 147 170]*0.9;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*0.9;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*0.9;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==2
                        Maize_Nfer=[171 168 147 170];% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143];% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27];% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    elseif Mo_EC==3
                        Maize_Nfer=[171 168 147 170]*1.1;% Optimated maize N fer in South China, Center China, Northeast, Northwest. % 187 kg/ha
                        Rice_Nfer=[146 144 154 143]*1.1;% Optimated rice N fer in Southeast, Southwest, Yangtze River, North. % 173 kg/ha
                        Wheat_Nfer=[117 187 137 132]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                        Soy_Nfer=[27 27 27 27]*1.1;% Optimated wheat N fer in Southwest, Center China, Yangtze River, North. % 213 kg/ha
                    end
                    Co_agroecological_zones =importdata('input\Co_agroecological_zones.txt');
                    for az=1:4
                        idd1=find(Co_agroecological_zones(:,3)==az);% Maize
                        idd2=find(Co_agroecological_zones(:,4)==az);% Rice
                        idd3=find(Co_agroecological_zones(:,5)==az);% Wheat
                        
                        RCOmaize_input(idd1,4)=Maize_Nfer(az)/(sum(RCOmaize_input(idd1,4).*FCo_3yieldarea(idd1,7,yr,YSSP))./sum(FCo_3yieldarea(idd1,7,yr,YSSP)))*RCOmaize_input(idd1,4);% maize Nfer usage (kg/ha)
                        RCOrice_input(idd2,4)=Rice_Nfer(az)/(sum(RCOrice_input(idd2,4).*FCo_3yieldarea(idd2,8,yr,YSSP))./sum(FCo_3yieldarea(idd2,8,yr,YSSP)))*RCOrice_input(idd2,4);% rice Nfer usage (kg/ha)
                        RCOwheat_input(idd3,4)=Wheat_Nfer(az)/(sum(RCOwheat_input(idd3,4).*FCo_3yieldarea(idd3,9,yr,YSSP))./sum(FCo_3yieldarea(idd3,9,yr,YSSP)))*RCOwheat_input(idd3,4);% wheat Nfer usage (kg/ha)
                        
                        RCOmaize_cost(idd1,3)=COmaize_cost(idd1,3).*RCOmaize_input(idd1,4)./COmaize_input(idd1,4)*2.8;% maize Nfer cost ($/ha)
                        RCOrice_cost(idd2,3)=COrice_cost(idd2,3).*RCOrice_input(idd2,4)./COrice_input(idd2,4)*2.8;% rice Nfer cost ($/ha)
                        RCOwheat_cost(idd3,3)=COwheat_cost(idd3,3).*RCOwheat_input(idd3,4)./COwheat_input(idd3,4)*2.8;% wheat Nfer cost ($/ha)
                    end
                    RCOsoy_input(:,4)=RCOsoy_input(:,4).*27./43.3;% wheat Nfer usage (kg/ha) enhancing FUE (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    RCOsoy_cost(:,3)=RCOsoy_cost(:,3).*RCOwheat_input(:,4)./COwheat_input(:,4)*2.8;% wheat Nfer cost ($/ha) % consider the N fertilizer price will increased due to enhancing efficiency. (Liu, Z., Ying, H., Chen, M., Bai, J., Xue, Y., Yin, Y., ... & Dou, Z. (2021). Optimization of China’s maize and soy production can ensure feed sufficiency at lower nitrogen and carbon footprints. Nature Food, 2(6), 426-433.)
                    
                    RCOmaize_cost(isinf(RCOmaize_cost)) =0;
                    RCOrice_cost(isinf(RCOrice_cost)) =0;
                    RCOwheat_cost(isinf(RCOwheat_cost)) =0;
                    RCOsoy_cost(isinf(RCOsoy_cost)) =0;
                    RCOmaize_input(isinf(RCOmaize_input)) =0;
                    RCOrice_input(isinf(RCOrice_input)) =0;
                    RCOwheat_input(isinf(RCOwheat_input)) =0;
                    RCOsoy_input(isinf(RCOsoy_input)) =0;
                    RCOmaize_EF(isinf(RCOmaize_EF)) =0;
                    RCOrice_EF(isinf(RCOrice_EF)) =0;
                    RCOwheat_EF(isinf(RCOwheat_EF)) =0;
                    RCOsoy_EF(isinf(RCOsoy_EF)) =0;
                    
                    load(strcat('output\Farm_grid_SSP5\Farm_grid','-',num2str(yr+1999),'.dat'),'-mat');
                    load(strcat('output\Farm_grid_SSP5\Dfarmunit','-',num2str(yr+1999),'.dat'),'-mat');
                    ThreeCropyield=FCo_3yieldarea(:,41:44,yr,YSSP);% yield
                    ThreeCroparea=FCo_3yieldarea(:,37:40,yr,YSSP);% SSP4.5
                    if Mo_EC==1
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*0.9;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*0.9;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*0.9;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*0.9;
                    elseif Mo_EC==2
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26);
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26);
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26);
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26);
                    elseif Mo_EC==3
                        RCOmaize_cost(:,2:26)=RCOmaize_cost(:,2:26)*1.1;
                        RCOrice_cost(:,2:26)=RCOrice_cost(:,2:26)*1.1;
                        RCOwheat_cost(:,2:26)=RCOwheat_cost(:,2:26)*1.1;
                        RCOsoy_cost(:,2:26)=RCOsoy_cost(:,2:26)*1.1;
                    end
                    
                    Grid1_fur_cropCE;
                    save(strcat('output\Result_sce\Sce_11\EC_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'EC_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_11\Cost_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Cost_Farm_fur','-v7.3');
                    save(strcat('output\Result_sce\Sce_11\Emis_Farm_fur','-',num2str(YSSP),'-',num2str(sce),'-',num2str(Mo_EC),'-',num2str(yr),'.dat'),'Emis_Farm_fur','-v7.3');
                end
            end
        end
    end
end


