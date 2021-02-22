require "json"
a= {"text": "t00f4i mu1ed1n t00ecm hu1ec3u tu01b01eddng cho b00e9","intents":[{"id":"822222685233799","name":"phe_duyet","confidence":0.9932}],"entities":{"findschool:findschool":[{"id":"302631604413290","name":"findschool","role":"findschool","start":9,"end":24,"body":"t\u00ecm hi\u1ec3u tr\u01b0\u1eddng","confidence":0.8658,"entities":[],"suggested":true,"value":"t\u00ecm hi\u1ec3u tr\u01b0\u1eddng","type":"value"}]},"traits":{}}
# b = a.to_hash
puts (a[:intents][0][:confidence])