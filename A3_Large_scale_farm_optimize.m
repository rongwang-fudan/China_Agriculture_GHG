clear;
clc;
% This code is used to optimize the spatial distribution of arable land in China after large-scale farming.
%
% %% SECTION TITLE
% % DESCRIPTIVE TEXT
load('output\Grid001_data.dat','-mat');
% % 1:FID;2:grid area;3:CO_ID;4:surimpreous;5:protect;6:available land;7:lon;8:lat;9:forest;10:grass;11:wetland;12:cropland;13:urban;14:ice;15:barren;16:water;
load('output\Grid1_Rurban_SSP5.dat','-mat');% urabn ratio from 2020 to 2060 for SSP3 sce.

% set scenarios
for yr=61 % urban ratio for SSP3_2026 to SSP3_2060.23:2022 year
    display(yr)
    R_forest=Grid001_data(:,9)./Grid001_data(:,2);R_forest(isnan(R_forest)) = 0;
    R_grass=Grid001_data(:,10)./Grid001_data(:,2);R_grass(isnan(R_grass)) = 0;
    R_wetland=Grid001_data(:,11)./Grid001_data(:,2);R_wetland(isnan(R_wetland)) = 0;
    R_crop=Grid001_data(:,12)./Grid001_data(:,2);R_crop(isnan(R_crop)) = 0;
    R_imper=Grid001_data(:,13)./Grid001_data(:,2);R_imper(isnan(R_imper)) = 0;
    R_bare=Grid001_data(:,15)./Grid001_data(:,2);R_bare(isnan(R_bare)) = 0;
    R_water=Grid001_data(:,16)./Grid001_data(:,2);R_water(isnan(R_water)) = 0;
    R_prot=Grid001_data(:,5)./Grid001_data(:,2);% protect area
    R_avai=Grid001_data(:,6)./Grid001_data(:,2);% available cropland for rcp26
    
    R_crop=R_crop-(Grid1_Rurban_SSP5(:,yr-20)-Grid1_Rurban_SSP5(:,3));idk=find(R_crop<0);R_crop(idk,1)=0;
    R_avai=R_avai-(Grid1_Rurban_SSP5(:,yr-20)-Grid1_Rurban_SSP5(:,3));idk=find(R_avai<0);R_avai(idk,1)=0;
    
    idx=find((R_crop>0.2 | R_avai>0.2) & R_forest<0.2 & R_wetland<0.1 & R_prot<0.1 & Grid001_data(:,3)>=0);
    A_area=zeros(size(idx,1),1);
    for i=1:size(idx,1)
        A_area(i)=min(max(R_avai(idx(i),1),R_crop(idx(i),1)),(R_crop(idx(i),1)+R_bare(idx(i),1)+R_grass(idx(i),1)+R_forest(idx(i),1))).*Grid001_data(idx(i),2);
    end
    Shiyan(yr,1)=sum(R_crop.*Grid001_data(:,2))/10^6;
    Shiyan(yr,2)=sum(A_area(:,1))/10^6;
    
    Farm_grid=zeros(size(idx,1),7);
    for i=1:size(idx,1)
%         display(i)
        coID=Grid001_data(idx(i),3);
        Usableland=min(max(R_avai(idx(i),1),R_crop(idx(i),1)),(R_crop(idx(i),1)+R_bare(idx(i),1)+R_grass(idx(i),1)+R_forest(idx(i),1))).*Grid001_data(idx(i),2);% usage land (the min of suitable land and suitable land)
        
        Farm_grid(i,1)=Grid001_data(idx(i),1);% Grid_ID
        Farm_grid(i,2)=Grid001_data(idx(i),3);% country ID
        Farm_grid(i,3)=Grid001_data(idx(i),7);% lon
        Farm_grid(i,4)=Grid001_data(idx(i),8);% lat
        Farm_grid(i,5)=Usableland;% usage land area (ha)
    end
    
    
    num=0;
    for co=1:2836
        display(co)
        idco=find(Farm_grid(:,2)==co-1);
        if size(idco,1)>0
            CoFarm_grid=Farm_grid(idco,:);
            
            for Ufarm=1:2500
                display(Ufarm)
                idzeros=find(CoFarm_grid(:,6)==0);
                if size(idzeros,1)>0
                    Large_CoFarm_grid=CoFarm_grid(idzeros,:);
                    num=num+1;
                    
                    % starting grid
                    Lon_min=min(Large_CoFarm_grid(:,3));% the min lon
                    
                    idlon=find(CoFarm_grid(:,3)==Lon_min & CoFarm_grid(:,6)==0);% the ID of min lon
                    if size(idlon,1)>0
                        Farm_grid(idco(idlon(1)),6)=num;
                        CoFarm_grid(idlon(1),6)=num;
                        Farm_grid(idco(idlon(1)),7)=1;
                        % level one
                        idgrid1=find(CoFarm_grid(:,6)==0 & (abs(CoFarm_grid(:,3)-CoFarm_grid(idlon(1),3))+abs(CoFarm_grid(:,4)-CoFarm_grid(idlon(1),4)))<0.011);% Adjacent grids
                        if size(idgrid1,1)>0
                            % level two
                            for i2=1:size(idgrid1,1)
                                Farm_grid(idco(idgrid1(i2)),6)=num;
                                CoFarm_grid(idgrid1(i2),6)=num;
                                Farm_grid(idco(idgrid1(i2)),7)=2;
                            end
                            for i2=1:size(idgrid1,1)
                                idgrid2=find(CoFarm_grid(:,6)==0 & (abs(CoFarm_grid(:,3)-CoFarm_grid(idgrid1(i2),3))+abs(CoFarm_grid(:,4)-CoFarm_grid(idgrid1(i2),4)))<0.011);% Adjacent grids
                                if size(idgrid2,1)>0
                                    % level three
                                    for i3=1:size(idgrid2,1)
                                        Farm_grid(idco(idgrid2(i3)),6)=num;
                                        CoFarm_grid(idgrid2(i3),6)=num;
                                        Farm_grid(idco(idgrid2(i3)),7)=3;
                                    end
                                    for i3=1:size(idgrid2,1)
                                        idgrid3=find(CoFarm_grid(:,6)==0 & (abs(CoFarm_grid(:,3)-CoFarm_grid(idgrid2(i3),3))+abs(CoFarm_grid(:,4)-CoFarm_grid(idgrid2(i3),4)))<0.011);% Adjacent grids
                                        if size(idgrid3,1)>0
                                            % level four
                                            for i4=1:size(idgrid3,1)
                                                Farm_grid(idco(idgrid3(i4)),6)=num;
                                                CoFarm_grid(idgrid3(i4),6)=num;
                                                Farm_grid(idco(idgrid3(i4)),7)=4;
                                            end
                                            for i4=1:size(idgrid3,1)
                                                idgrid4=find(CoFarm_grid(:,6)==0 & (abs(CoFarm_grid(:,3)-CoFarm_grid(idgrid3(i4),3))+abs(CoFarm_grid(:,4)-CoFarm_grid(idgrid3(i4),4)))<0.011);% Adjacent grids
                                                if size(idgrid4,1)>0
                                                    % level five
                                                    for i5=1:size(idgrid4,1)
                                                        Farm_grid(idco(idgrid4(i5)),6)=num;
                                                        CoFarm_grid(idgrid4(i5),6)=num;
                                                        Farm_grid(idco(idgrid4(i5)),7)=5;
                                                    end
                                                    for i5=1:size(idgrid4,1)
                                                        idgrid5=find(CoFarm_grid(:,6)==0 & (abs(CoFarm_grid(:,3)-CoFarm_grid(idgrid4(i5),3))+abs(CoFarm_grid(:,4)-CoFarm_grid(idgrid4(i5),4)))<0.011);% Adjacent grids
                                                        if size(idgrid5,1)>0
                                                            % level six
                                                            for i6=1:size(idgrid5,1)
                                                                Farm_grid(idco(idgrid5(i6)),6)=num;
                                                                CoFarm_grid(idgrid5(i6),6)=num;
                                                                Farm_grid(idco(idgrid5(i6)),7)=6;
                                                            end
                                                            for i6=1:size(idgrid5,1)
                                                                idgrid6=find(CoFarm_grid(:,6)==0 & (abs(CoFarm_grid(:,3)-CoFarm_grid(idgrid5(i6),3))+abs(CoFarm_grid(:,4)-CoFarm_grid(idgrid5(i6),4)))<0.011);% Adjacent grids
                                                                if size(idgrid6,1)>0
                                                                    % level seven
                                                                    for i7=1:size(idgrid6,1)
                                                                        Farm_grid(idco(idgrid6(i7)),6)=num;
                                                                        CoFarm_grid(idgrid6(i7),6)=num;
                                                                        Farm_grid(idco(idgrid6(i7)),7)=7;
                                                                    end
                                                                    for i7=1:size(idgrid6,1)
                                                                        idgrid7=find(CoFarm_grid(:,6)==0 & (abs(CoFarm_grid(:,3)-CoFarm_grid(idgrid6(i7),3))+abs(CoFarm_grid(:,4)-CoFarm_grid(idgrid6(i7),4)))<0.011);% Adjacent grids
                                                                        if size(idgrid7,1)>0
                                                                            % level eight
                                                                            for i8=1:size(idgrid7,1)
                                                                                Farm_grid(idco(idgrid7(i8)),6)=num;
                                                                                CoFarm_grid(idgrid7(i8),6)=num;
                                                                                Farm_grid(idco(idgrid7(i8)),7)=8;
                                                                            end
                                                                            for i8=1:size(idgrid7,1)
                                                                                idgrid8=find(CoFarm_grid(:,6)==0 & (abs(CoFarm_grid(:,3)-CoFarm_grid(idgrid7(i8),3))+abs(CoFarm_grid(:,4)-CoFarm_grid(idgrid7(i8),4)))<0.011);% Adjacent grids
                                                                                if size(idgrid8,1)>0
                                                                                    % level nine
                                                                                    for i9=1:size(idgrid8,1)
                                                                                        Farm_grid(idco(idgrid8(i9)),6)=num;
                                                                                        CoFarm_grid(idgrid8(i9),6)=num;
                                                                                        Farm_grid(idco(idgrid8(i9)),7)=9;
                                                                                    end
                                                                                    for i9=1:size(idgrid8,1)
                                                                                        idgrid9=find(CoFarm_grid(:,6)==0 & (abs(CoFarm_grid(:,3)-CoFarm_grid(idgrid8(i9),3))+abs(CoFarm_grid(:,4)-CoFarm_grid(idgrid8(i9),4)))<0.011);% Adjacent grids
                                                                                        if size(idgrid9,1)>0
                                                                                            % level ten
                                                                                            for i10=1:size(idgrid9,1)
                                                                                                Farm_grid(idco(idgrid9(i10)),6)=num;
                                                                                                CoFarm_grid(idgrid9(i10),6)=num;
                                                                                                Farm_grid(idco(idgrid9(i10)),7)=10;
                                                                                            end
                                                                                            for i10=1:size(idgrid9,1)
                                                                                                idgrid10=find(CoFarm_grid(:,6)==0 & (abs(CoFarm_grid(:,3)-CoFarm_grid(idgrid9(i10),3))+abs(CoFarm_grid(:,4)-CoFarm_grid(idgrid9(i10),4)))<0.011);% Adjacent grids
                                                                                                if size(idgrid10,1)>0
                                                                                                    % level eleven
                                                                                                    for i11=1:size(idgrid10,1)
                                                                                                        Farm_grid(idco(idgrid10(i11)),6)=num;
                                                                                                        CoFarm_grid(idgrid10(i11),6)=num;
                                                                                                        Farm_grid(idco(idgrid10(i11)),7)=11;
                                                                                                    end
                                                                                                    for i11=1:size(idgrid10,1)
                                                                                                        idgrid11=find(CoFarm_grid(:,6)==0 & (abs(CoFarm_grid(:,3)-CoFarm_grid(idgrid10(i11),3))+abs(CoFarm_grid(:,4)-CoFarm_grid(idgrid10(i11),4)))<0.011);% Adjacent grids
                                                                                                        if size(idgrid11,1)>0
                                                                                                            % level twelve
                                                                                                            for i12=1:size(idgrid11,1)
                                                                                                                Farm_grid(idco(idgrid11(i12)),6)=num;
                                                                                                                CoFarm_grid(idgrid11(i12),6)=num;
                                                                                                                Farm_grid(idco(idgrid11(i12)),7)=12;
                                                                                                            end
                                                                                                            for i12=1:size(idgrid11,1)
                                                                                                                idgrid12=find(CoFarm_grid(:,6)==0 & (abs(CoFarm_grid(:,3)-CoFarm_grid(idgrid11(i12),3))+abs(CoFarm_grid(:,4)-CoFarm_grid(idgrid11(i12),4)))<0.011);% Adjacent grids
                                                                                                                if size(idgrid12,1)>0
                                                                                                                    % level 13
                                                                                                                    for i13=1:size(idgrid12,1)
                                                                                                                        Farm_grid(idco(idgrid12(i13)),6)=num;
                                                                                                                        CoFarm_grid(idgrid12(i13),6)=num;
                                                                                                                        Farm_grid(idco(idgrid12(i13)),7)=13;
                                                                                                                    end
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                else
                    break;
                end
            end
        end
    end
    
    for i=1:size(idx,1)
%         display(i)
        Farm_grid(i,8)=R_crop(idx(i),1).*Grid001_data(idx(i),2);% crop land area
        Farm_grid(i,9)=R_bare(idx(i),1).*Grid001_data(idx(i),2);% bare land area
        Farm_grid(i,10)=R_grass(idx(i),1).*Grid001_data(idx(i),2);% grass land area
        Farm_grid(i,11)=0;% shurb land area
        Farm_grid(i,12)=R_forest(idx(i),1).*Grid001_data(idx(i),2);% forest land area
        
        Farm_grid(i,13)=min(Farm_grid(i,9),Farm_grid(i,5)-Farm_grid(i,8));% real bare land area
        Farm_grid(i,14)=min(Farm_grid(i,10),Farm_grid(i,5)-Farm_grid(i,13)-Farm_grid(i,8));% real grass land area
        Farm_grid(i,15)=0;% real shurb land area
        Farm_grid(i,16)=min(Farm_grid(i,12),Farm_grid(i,5)-Farm_grid(i,13)-Farm_grid(i,14)-Farm_grid(i,15)-Farm_grid(i,8));% real forest land area
    end
    idd1=find(Farm_grid(:,13)>-1e-10 & Farm_grid(:,13)<1e-10);Farm_grid(idd1,13)=0;
    idd2=find(Farm_grid(:,14)>-1e-10 & Farm_grid(:,14)<1e-10);Farm_grid(idd2,14)=0;
    idd3=find(Farm_grid(:,15)>-1e-10 & Farm_grid(:,15)<1e-10);Farm_grid(idd3,15)=0;
    idd4=find(Farm_grid(:,16)>-1e-10 & Farm_grid(:,16)<1e-10);Farm_grid(idd4,16)=0;
    save(strcat('output\Farm_grid_SSP5\Farm_grid','-',num2str(1999+yr),'.dat'),'Farm_grid','-v7.3');
    
    Farm_num=max(Farm_grid(:,6));
    Dfarmunit=zeros(Farm_num,8);
    for i=1:Farm_num
%         display(i)
        idf=find(Farm_grid(:,6)==i);
        SFarm_grid=Farm_grid(idf,:);
        Dfarmunit(i,1)=SFarm_grid(1,2);
        
        Dfarmunit(i,2)=sum(Farm_grid(idf,8));% Acrop crop land (ha)
        Dfarmunit(i,3)=sum(Farm_grid(idf,13));% Abare bare land (ha)
        Dfarmunit(i,4)=sum(Farm_grid(idf,14));% Agrass grass land (ha)
        Dfarmunit(i,5)=sum(Farm_grid(idf,15));% Ashurb shurb land (ha)
        Dfarmunit(i,6)=sum(Farm_grid(idf,16));% Aforest fores land (ha)
        Dfarmunit(i,7)=size(idf,1);% num of grid in each farm unit.
        Dfarmunit(i,8)=sum(Farm_grid(idf,8))+sum(Farm_grid(idf,13))+sum(Farm_grid(idf,14))+sum(Farm_grid(idf,15))+sum(Farm_grid(idf,16));% num of grid in each farm unit.
    end
    save(strcat('output\Farm_grid_SSP5\Dfarmunit','-',num2str(1999+yr),'.dat'),'Dfarmunit','-v7.3');
end

