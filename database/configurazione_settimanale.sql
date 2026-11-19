alter table public."SettimaneCassano" add column "Configurazione" jsonb;
update public."SettimaneCassano" s set "Configurazione"=c."Dati"
from public."ConfigurazioneCassano" c
where c."ID_Magazzino"=s."ID_Magazzino" and jsonb_typeof(c."Dati")='object';
notify pgrst, 'reload schema';
