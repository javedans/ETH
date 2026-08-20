select 
transaction_hash,
date,
token_address,
value
from {{source('eth','token_transfers')}}
where lower(token_address) in ('0x50327c6c5a14dcade707abad2e27eb517df87ab5')
