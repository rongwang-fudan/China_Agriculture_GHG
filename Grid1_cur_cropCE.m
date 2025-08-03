% This code is used to simulate China's agricultural grain production and costs under the current distribution of cultivated land.
% CUR scenario in 2020 year.

EC_Farm_cur=zeros(2836,14);% each farm grid have one emission and cost.
Cost_Farm_cur=zeros(2836,40);% each farm grid have one cost.
Emis_Farm_cur=zeros(2836,40);% each farm grid have one emission.
Manure_cost=180/1000;% US $/kg; Commercial manure is 180 US$ t-1 (2021-Rethinking application of animal manure for wheat production in China)
Manure_Ccon=0.05;% Date source: Chen, X., Ma, C., Zhou, H., Liu, Y., Huang, X., Wang, M., ... & Zhang, F. (2021). Identifying the main crops and key factors determining the carbon footprint of crop production in China, 2001–2018. Resources, Conservation and Recycling, 172, 105661.
GWP_CH4=27;
GWP_N2O=273;
for co=1:2836
    Ymai=Coyield(co,1,yr);% yield of maize （t/ha）
    Yric=Coyield(co,2,yr);% yield of rice （t/ha）
    Ywhe=Coyield(co,3,yr);% yield of wheat （t/ha）
    Ysoy=Coyield(co,4,yr);% yield of soybean （t/ha）
    CAratio=Coyield(co,5:8,yr);% ratio of maize, rice, wheat and soybean area.
    Acrop=Cocurfarm(co,yr);% crop land (ha)
    CO_ID=co-1;
    
    CropS_mai=Acrop*CAratio(1,1);% maize area
    CropS_ric=Acrop*CAratio(1,2);% rice area
    CropS_whe=Acrop*CAratio(1,3);% wheat area
    CropS_soy=Acrop*CAratio(1,4);% soybean area
    
    Pro_mai=CropS_mai*Ymai;% T grain for maize
    Pro_ric=CropS_ric*Yric;% T grain for rice
    Pro_whe=CropS_whe*Ywhe;% T grain for wheat
    Pro_soy=CropS_soy*Ysoy;% T grain for soybean
    
    Cost_mai=CropS_mai*sum(COmaize_cost(co,2:24));% Total cost, US $
    Cost_ric=CropS_ric*sum(COrice_cost(co,2:24));% Total cost, US $
    Cost_whe=CropS_whe*sum(COwheat_cost(co,2:24));% Total cost, US $
    Cost_soy=CropS_soy*sum(COsoy_cost(co,2:24));% Total cost, US $
    
    Cost_mai_Nfer=CropS_mai*COmaize_cost(co,3);% N fer cost,US $
    Cost_ric_Nfer=CropS_ric*COrice_cost(co,3);% N fer cost,US $
    Cost_whe_Nfer=CropS_whe*COwheat_cost(co,3);% N fer cost,US $
    Cost_soy_Nfer=CropS_soy*COsoy_cost(co,3);% N fer cost,US $
    Cost_Nfer=Cost_mai_Nfer+Cost_ric_Nfer+Cost_whe_Nfer+Cost_soy_Nfer;% Total N fer cost,US $
    
    Cost_mai_mach=CropS_mai*COmaize_cost(co,9);% machine cost,US $
    Cost_ric_mach=CropS_ric*COrice_cost(co,9);% machine cost,US $
    Cost_whe_mach=CropS_whe*COwheat_cost(co,9);% machine cost,US $
    Cost_soy_mach=CropS_soy*COsoy_cost(co,9);% machine cost,US $
    Cost_mach=Cost_mai_mach+Cost_ric_mach+Cost_whe_mach+Cost_soy_mach;% Total machine cost,US $
    
    Cost_mai_water=CropS_mai*COmaize_cost(co,11);% water cost,US $
    Cost_ric_water=CropS_ric*COrice_cost(co,11);% water cost,US $
    Cost_whe_water=CropS_whe*COwheat_cost(co,11);% water cost,US $
    Cost_soy_water=CropS_soy*COsoy_cost(co,11);% water cost,US $
    Cost_water=Cost_mai_water+Cost_ric_water+Cost_whe_water+Cost_soy_water;% Total water cost,US $
    
    Cost_mai_labor=CropS_mai*COmaize_cost(co,13);% labor cost,US $
    Cost_ric_labor=CropS_ric*COrice_cost(co,13);% labor cost,US $
    Cost_whe_labor=CropS_whe*COwheat_cost(co,13);% labor cost,US $
    Cost_soy_labor=CropS_soy*COsoy_cost(co,13);% labor cost,US $
    Cost_labor=Cost_mai_labor+Cost_ric_labor+Cost_whe_labor+Cost_soy_labor;% Total labor cost,US $
    
    Cost_mai_seed=CropS_mai*COmaize_cost(co,2);% seed cost,US $
    Cost_ric_seed=CropS_ric*COrice_cost(co,2);% seed cost,US $
    Cost_whe_seed=CropS_whe*COwheat_cost(co,2);% seed cost,US $
    Cost_soy_seed=CropS_soy*COsoy_cost(co,2);% seed cost,US $
    Cost_seed=Cost_mai_seed+Cost_ric_seed+Cost_whe_seed+Cost_soy_seed;% Total seed cost,US $
    
    Cost_mai_land=CropS_mai*COmaize_cost(co,24);% land cost,US $
    Cost_ric_land=CropS_ric*COrice_cost(co,24);% land cost,US $
    Cost_whe_land=CropS_whe*COwheat_cost(co,24);% land cost,US $
    Cost_soy_land=CropS_soy*COsoy_cost(co,24);% land cost,US $
    Cost_land=Cost_mai_land+Cost_ric_land+Cost_whe_land+Cost_soy_land;% Total land cost,US $
    
    
    Cost_mai_other=CropS_mai*((sum(COmaize_cost(co,2:24))-sum(COmaize_cost(co,[3 9 11 13 2 24]))));% other cost,US $
    Cost_ric_other=CropS_ric*((sum(COrice_cost(co,2:24))-sum(COrice_cost(co,[3 9 11 13 2 24]))));% other cost,US $
    Cost_whe_other=CropS_whe*((sum(COwheat_cost(co,2:24))-sum(COwheat_cost(co,[3 9 11 13 2 24]))));% other cost,US $
    Cost_soy_other=CropS_soy*((sum(COsoy_cost(co,2:24))-sum(COsoy_cost(co,[3 9 11 13 2 24]))));% other cost,US $
    Cost_other=Cost_mai_other+Cost_ric_other+Cost_whe_other+Cost_soy_other;% Total other cost,US $
    
    Cost_mai_conv=0;% % no landuse conversions
    Cost_ric_conv=0;% % no landuse conversions
    Cost_whe_conv=0;% % no landuse conversions
    Cost_soy_conv=0;% % no landuse conversions
    
    Emis_mai_ferpro=CropS_mai*(sum(COmaize_input(co,4:6).*COmaize_EF(co,2:4)))/1000;% t CO₂e
    Emis_ric_ferpro=CropS_ric*(sum(COrice_input(co,4:6).*COrice_EF(co,2:4)))/1000;% t CO₂e
    Emis_whe_ferpro=CropS_whe*(sum(COwheat_input(co,4:6).*COwheat_EF(co,2:4)))/1000;% t CO₂e
    Emis_soy_ferpro=CropS_soy*(sum(COsoy_input(co,4:6).*COsoy_EF(co,2:4)))/1000;% t CO₂e
    Emis_ferpro=Emis_mai_ferpro+Emis_ric_ferpro+Emis_whe_ferpro+Emis_soy_ferpro;% t CO₂e
    
    Emis_mai_ele=CropS_mai*(COmaize_input(co,7).*COmaize_EF(co,5))/1000;% t CO₂e
    Emis_ric_ele=CropS_ric*(COrice_input(co,7).*COrice_EF(co,5))/1000;% t CO₂e
    Emis_whe_ele=CropS_whe*(COwheat_input(co,7).*COwheat_EF(co,5))/1000;% t CO₂e
    Emis_soy_ele=CropS_soy*(COsoy_input(co,7).*COsoy_EF(co,5))/1000;% t CO₂e
    Emis_ele=Emis_mai_ele+Emis_ric_ele+Emis_whe_ele+Emis_soy_ele;% t CO₂e
    
    Emis_mai_fuel=CropS_mai*(sum(COmaize_input(co,8:9).*COmaize_EF(co,6:7)))/1000;% t CO₂e
    Emis_ric_fuel=CropS_ric*(sum(COrice_input(co,8:9).*COrice_EF(co,6:7)))/1000;% t CO₂e
    Emis_whe_fuel=CropS_whe*(sum(COwheat_input(co,8:9).*COwheat_EF(co,6:7)))/1000;% t CO₂e
    Emis_soy_fuel=CropS_soy*(sum(COsoy_input(co,8:9).*COsoy_EF(co,6:7)))/1000;% t CO₂e
    Emis_fuel=Emis_mai_fuel+Emis_ric_fuel+Emis_whe_fuel+Emis_soy_fuel;% t CO₂e
    
    Emis_mai_plafilm=CropS_mai*(COmaize_input(co,10).*COmaize_EF(co,8))/1000;% t CO₂e
    Emis_ric_plafilm=CropS_ric*(COrice_input(co,10).*COrice_EF(co,8))/1000;% t CO₂e
    Emis_whe_plafilm=CropS_whe*(COwheat_input(co,10).*COwheat_EF(co,8))/1000;% t CO₂e
    Emis_soy_plafilm=CropS_soy*(COsoy_input(co,10).*COsoy_EF(co,8))/1000;% t CO₂e
    Emis_plafilm=Emis_mai_plafilm+Emis_ric_plafilm+Emis_whe_plafilm+Emis_soy_plafilm;% t CO₂e
    
    Emis_mai_seed=CropS_mai*(COmaize_input(co,11).*COmaize_EF(co,9))/1000;% t CO₂e
    Emis_ric_seed=CropS_ric*(COrice_input(co,11).*COrice_EF(co,9))/1000;% t CO₂e
    Emis_whe_seed=CropS_whe*(COwheat_input(co,11).*COwheat_EF(co,9))/1000;% t CO₂e
    Emis_soy_seed=CropS_soy*(COsoy_input(co,11).*COsoy_EF(co,9))/1000;% t CO₂e
    Emis_seed=Emis_mai_seed+Emis_ric_seed+Emis_whe_seed+Emis_soy_seed;% t CO₂e
    
    Emis_mai_pest=CropS_mai*(COmaize_input(co,12).*COmaize_EF(co,10))/1000;% t CO₂e
    Emis_ric_pest=CropS_ric*(COrice_input(co,12).*COrice_EF(co,10))/1000;% t CO₂e
    Emis_whe_pest=CropS_whe*(COwheat_input(co,12).*COwheat_EF(co,10))/1000;% t CO₂e
    Emis_soy_pest=CropS_soy*(COsoy_input(co,12).*COsoy_EF(co,10))/1000;% t CO₂e
    Emis_pest=Emis_mai_pest+Emis_ric_pest+Emis_whe_pest+Emis_soy_pest;% t CO₂e
    
    Emis_mai_CH4=CropS_mai*COmaize_EF(co,11)*GWP_CH4/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_ric_CH4=CropS_ric*COrice_EF(co,11)*GWP_CH4/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_whe_CH4=CropS_whe*COwheat_EF(co,11)*GWP_CH4/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_soy_CH4=CropS_soy*COsoy_EF(co,11)*GWP_CH4/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_CH4=Emis_mai_CH4+Emis_ric_CH4+Emis_whe_CH4+Emis_soy_CH4;% t CO₂e
    
    Emis_mai_ferapp=CropS_mai*(COmaize_input(co,4).*COmaize_EF(co,12))*44/28*GWP_N2O/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_ric_ferapp=CropS_ric*(COrice_input(co,4).*COrice_EF(co,12))*44/28*GWP_N2O/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_whe_ferapp=CropS_whe*(COwheat_input(co,4).*COwheat_EF(co,12))*44/28*GWP_N2O/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_soy_ferapp=CropS_soy*(COsoy_input(co,4).*COsoy_EF(co,12))*44/28*GWP_N2O/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_ferapp=Emis_mai_ferapp+Emis_ric_ferapp+Emis_whe_ferapp+Emis_soy_ferapp;% t CO₂e
    
    Emis_mai_ELUC=0;% no landuse change in current scenario
    Emis_ric_ELUC=0;% no landuse change in current scenario
    Emis_whe_ELUC=0;% no landuse change in current scenario
    Emis_soy_ELUC=0;% no landuse change in current scenario
    
   
    SR=SRario(co,1);
    
    Emis_mai_SOC=CropS_mai*(((Ymai*1000*0.8*SR+(Ymai*1000*0.8*SR+Ymai*1000)/6.4)/1000*29.025+272.33)+COmaize_cost(co,6)/Manure_cost*Manure_Ccon*0.191)*44/12/1000;% t CO₂e, SOC due to residue retween, manure application, and no tilliage
    Emis_ric_SOC=CropS_ric*(((Yric*1000*1.1*SR+(Yric*1000*1.1*SR+Yric*1000)/4.6)/1000*29.025+272.33)+COrice_cost(co,6)/Manure_cost*Manure_Ccon*0.191)*44/12/1000;% t CO₂e, SOC due to residue retween, manure application, and no tilliage
    Emis_whe_SOC=CropS_whe*(((Ywhe*1000*0.9*SR+(Ywhe*1000*0.9*SR+Ywhe*1000)/3.2)/1000*29.025+272.33)+COwheat_cost(co,6)/Manure_cost*Manure_Ccon*0.191)*44/12/1000;% t CO₂e, SOC due to residue retween, manure application, and no tilliage
    Emis_soy_SOC=CropS_soy*(((Ysoy*1000*1.0*SR+(Ysoy*1000*1.0*SR+Ysoy*1000)/7.7)/1000*29.025+272.33)+COsoy_cost(co,6)/Manure_cost*Manure_Ccon*0.191)*44/12/1000;% t CO₂e, SOC due to residue retween, manure application, and no tilliage
    Emis_SOC=Emis_mai_SOC+Emis_ric_SOC+Emis_whe_SOC+Emis_soy_SOC;% kg CO₂e
    
    Residue_mai=CropS_mai*Ymai*0.8*(6.4/(6.4+1))*0.9;% t residue % SR is the ratio of straw return to soil ratio
    Residue_ric=CropS_ric*Yric*1.1*(4.6/(4.6+1))*0.9;% t residue % SR is the ratio of straw return to soil ratio
    Residue_whe=CropS_whe*Ywhe*0.9*(3.2/(3.2+1))*0.9;% t residue % SR is the ratio of straw return to soil ratio
    Residue_soy=CropS_soy*Ysoy*1.0*(7.7/(7.7+1))*0.9;% t residue % SR is the ratio of straw return to soil ratio
    Residue=Residue_mai+Residue_ric+Residue_whe+Residue_soy;% t residue
    
    Emis_mai=Emis_mai_ELUC+Emis_mai_ferpro+Emis_mai_ele+Emis_mai_fuel+Emis_mai_plafilm+Emis_mai_seed+Emis_mai_pest+Emis_mai_CH4+Emis_mai_ferapp-Emis_mai_SOC;
    Emis_ric=Emis_ric_ELUC+Emis_ric_ferpro+Emis_ric_ele+Emis_ric_fuel+Emis_ric_plafilm+Emis_ric_seed+Emis_ric_pest+Emis_ric_CH4+Emis_ric_ferapp-Emis_ric_SOC;
    Emis_whe=Emis_whe_ELUC+Emis_whe_ferpro+Emis_whe_ele+Emis_whe_fuel+Emis_whe_plafilm+Emis_whe_seed+Emis_whe_pest+Emis_whe_CH4+Emis_whe_ferapp-Emis_whe_SOC;
    Emis_soy=Emis_soy_ELUC+Emis_soy_ferpro+Emis_soy_ele+Emis_soy_fuel+Emis_soy_plafilm+Emis_soy_seed+Emis_soy_pest+Emis_soy_CH4+Emis_soy_ferapp-Emis_soy_SOC;
    
    maize_labornum=CropS_mai*COmaize_cost(co,13)/(150*5*15/7.17);% assume 150 yuan/day/person (王佳康，劳动力成本、机械化与农业产业升级)
    rice_labornum=CropS_ric*COrice_cost(co,13)/(150*5*15/7.17);% assume 150 yuan/day/person (王佳康，劳动力成本、机械化与农业产业升级)
    wheat_labornum=CropS_whe*COwheat_cost(co,13)/(150*5*15/7.17);% assume 150 yuan/day/person (王佳康，劳动力成本、机械化与农业产业升级)
    soy_labornum=CropS_soy*COsoy_cost(co,13)/(150*5*15/7.17);% assume 150 yuan/day/person (王佳康，劳动力成本、机械化与农业产业升级)
    
    Water_mai=CropS_mai*COmaize_cost(co,25);% water consumption, m3
    Water_ric=CropS_ric*COrice_cost(co,25);% water consumption, m3
    Water_whe=CropS_whe*COwheat_cost(co,25);% water consumption, m3
    Water_soy=CropS_soy*COsoy_cost(co,25);% water consumption, m3
    
    Nfer_mai=CropS_mai*COmaize_input(co,4);% Nfer amount, kg N
    Nfer_ric=CropS_ric*COrice_input(co,4);% Nfer amount, kg N
    Nfer_whe=CropS_whe*COwheat_input(co,4);% Nfer amount, kg N
    Nfer_soy=CropS_soy*COsoy_input(co,4);% Nfer amount, kg N
    
    Pfer_mai=CropS_mai*COmaize_input(co,5);% Pfer amount, kg P
    Pfer_ric=CropS_ric*COrice_input(co,5);% Pfer amount, kg P
    Pfer_whe=CropS_whe*COwheat_input(co,5);% Pfer amount, kg P
    Pfer_soy=CropS_soy*COsoy_input(co,5);% Pfer amount, kg P
    
    
    EC_Farm_cur(co,1:14)=[CO_ID Acrop CropS_mai+CropS_ric+CropS_whe+CropS_soy Pro_mai+Pro_ric+Pro_whe+Pro_soy Cost_mai+Cost_ric+Cost_whe+Cost_soy Emis_mai+Emis_ric+Emis_whe+Emis_soy Residue_mai+Residue_ric+Residue_whe+Residue_soy Water_mai+Water_ric+Water_whe+Water_soy Nfer_mai+Nfer_ric+Nfer_whe+Nfer_soy Pfer_mai+Pfer_ric+Pfer_whe+Pfer_soy 0 0 0 0];
%     1:CO_ID;2:Acrop (ha);3:Crop sum area (ha);4:Crop production (t grain);5:Crop cost (US $);6:Crop emission (t CO₂e);7:Crop residue (t residue);8:Water (m3);9:Nfer (kg N);10:Pfer (kg P);11:bareland;12:grassland;13:shurbland;14:forest
    
    Cost_Farm_cur(co,1:40)=[Pro_mai Pro_ric Pro_whe Pro_soy Cost_mai_conv Cost_ric_conv Cost_whe_conv  Cost_soy_conv Cost_mai_mach Cost_ric_mach Cost_whe_mach Cost_soy_mach Cost_mai_labor Cost_ric_labor Cost_whe_labor Cost_soy_labor Cost_mai_Nfer Cost_ric_Nfer Cost_whe_Nfer Cost_soy_Nfer Cost_mai_water Cost_ric_water Cost_whe_water Cost_soy_water Cost_mai_seed Cost_ric_seed Cost_whe_seed Cost_soy_seed Cost_mai_land Cost_ric_land Cost_whe_land Cost_soy_land Cost_mai_other Cost_ric_other Cost_whe_other Cost_soy_other CropS_mai CropS_ric CropS_whe CropS_soy];%  US $
    Emis_Farm_cur(co,1:40)=[Emis_mai_ELUC Emis_ric_ELUC Emis_whe_ELUC Emis_soy_ELUC Emis_mai_ferpro Emis_ric_ferpro Emis_whe_ferpro Emis_soy_ferpro Emis_mai_ele Emis_ric_ele Emis_whe_ele Emis_soy_ele Emis_mai_fuel Emis_ric_fuel Emis_whe_fuel Emis_soy_fuel Emis_mai_plafilm Emis_ric_plafilm Emis_whe_plafilm Emis_soy_plafilm Emis_mai_seed Emis_ric_seed Emis_whe_seed Emis_soy_seed Emis_mai_pest Emis_ric_pest Emis_whe_pest Emis_soy_pest Emis_mai_CH4 Emis_ric_CH4 Emis_whe_CH4 Emis_soy_CH4 Emis_mai_ferapp Emis_ric_ferapp Emis_whe_ferapp Emis_soy_ferapp -Emis_mai_SOC -Emis_ric_SOC -Emis_whe_SOC -Emis_soy_SOC];% kg CO₂e
end


