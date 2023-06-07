function [ uzaklik_dizisi ] = Baginti_Oklit( veri_seti,yeni_veri, cozumAdayi )
[ornek_sayisi,ozellik_sayisi]=size(veri_seti);
[yeni_veri_ornek_sayisi,yeni_veri_ozellik_sayisi] = size(yeni_veri);

for i=1:yeni_veri_ornek_sayisi
    for k=1:ornek_sayisi
        toplam=0;
        for j=1:ozellik_sayisi
            toplam=toplam+(cozumAdayi(j)*(veri_seti(k,j)-yeni_veri(i,j)))^2;
        end
        uzaklik_dizisi(i,k)=sqrt(toplam);
    end
end

end

