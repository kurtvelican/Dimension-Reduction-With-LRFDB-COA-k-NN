function yuzdeHata = knnFunc(cozumAdayi,egitimVerisi, testVerisi, egitimSinifVerisi, testSinifVerisi,komsu_sayisi)
        uzaklik_dizisi=Baginti_Oklit(egitimVerisi,testVerisi,cozumAdayi);
        komsu = Komsu_Bul(komsu_sayisi,uzaklik_dizisi,egitimSinifVerisi);
        sinifDizisi = Sinif_Bul(komsu);
        hata = 0;
        for i=1:size(sinifDizisi,2)
            if string(sinifDizisi{i}) ~= string(testSinifVerisi{i})
                hata = hata + 1;
            end
        end
        yuzdeHata = hata/size(testSinifVerisi,1);
end