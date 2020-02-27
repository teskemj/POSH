NET USE F: /delete
NET USE G: /delete
NET USE P: /delete
NET USE R: /delete

;NET USE F: \\erp\D /persistent:no
NET USE G: \\erp\DATA\engineering /persistent:no
;NET USE P: \\erp\APPS /persistent:no
;NET USE R: \\erp\DATA /persistent:no

NET TIME \\dc /SET /Y
