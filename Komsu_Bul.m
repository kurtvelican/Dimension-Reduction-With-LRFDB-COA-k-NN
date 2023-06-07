
function [komsularDizisi]= Komsu_Bul( komsu_sayisi,uzaklik_dizisi,veri_siniflari)
    komsu.sinif = "";
    komsu.indeks = 0;
    komsu.uzaklik = 0;
    komsu.adet = 0;

    komsularDizisi = repmat(komsu,size(uzaklik_dizisi,1),komsu_sayisi);

    for i=1:size(uzaklik_dizisi,1)
        uzaklik_verisi = uzaklik_dizisi(i,:);
        [sirali_uzaklik_verisi,indeksleri] = sort(uzaklik_verisi);

        for j=1:komsu_sayisi
            komsularDizisi(i,j).sinif=veri_siniflari(indeksleri(j));
            komsularDizisi(i,j).adet=0;   % i. komþunun sýnýfýndan kaç adet var
        end
    end

end

