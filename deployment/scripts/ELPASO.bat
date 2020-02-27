@echo off

NET USE F: /delete
NET USE G: /delete
NET USE P: /delete
NET USE R: /delete


NET USE F: \\lpierp\D /persistent:no
NET USE G: \\lpierp\DATA /persistent:no
NET USE P: \\lpierp\apps /persistent:no
NET USE R: \\lpierp\DATA /persistent:no
NET TIME \\lpidc2 /SET /Y
