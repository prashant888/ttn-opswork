node.override['postfix']['mail_type'] = 'client'
node.override['postfix']['main']['relayhost'] = 'smtp.fen.com'
include_recipe 'postfix'
