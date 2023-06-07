
function [sinif]= Sinif_Bul(komsu)
   
    for i=1:size(komsu,1)
        for j=1:size(komsu,2)
            for k=1:size(komsu,2)
              if(strcmpi(komsu(i,j).sinif,komsu(i,k).sinif))
                 komsu(i,j).adet=komsu(i,j).adet +1;
              end
            end
        end
    end

    for i=1:size(komsu,1)
        en_cok_sinif_indeks = 1;
        for j=1:size(komsu,2)-1
          if((komsu(i,en_cok_sinif_indeks).adet<komsu(i,j+1).adet))
               en_cok_sinif_indeks=j+1;
          end
        end
            sinif(i) = komsu(i,en_cok_sinif_indeks).sinif;
    end
end

