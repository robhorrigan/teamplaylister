require 'rest-client'
require 'json'
#puts RestClient.post('https://api.spotify.com/v1/users/beaubrun/playlists', {name: "Booty Shaking Hits: Hot Fiya Edition", public: false}, {"Authorization" => 'Bearer BQBEGdt11RhcnK63IS5a4xa5BPeFe3m6Sr1hJw61ZTa1DSZWpbBi1ua77eRjSD-jLCsGRw4TMDX1S-oAi5b_mV_uPOvDCQJ52MSlfUO41dh5ZkFlCZOt1nA1asthY59H_svVoNmNbTmADBoFSAGKO1kOQ-9oxNFNS6g3ZjKrR74P0GLwFb7PKFWrZIEAzldersQyJUde7PMU6w', "Content-Type" => "application/json)"})

puts RestClient.post('https://api.spotify.com/v1/users/beaubrun/playlists', {name: "Super Big Booty Shakin' mix. Dolla Dolla bill Ya'll part 6", public: false}.to_json, {"Content-Type" => "application/json", "Authorization" => 'Bearer BQBEGdt11RhcnK63IS5a4xa5BPeFe3m6Sr1hJw61ZTa1DSZWpbBi1ua77eRjSD-jLCsGRw4TMDX1S-oAi5b_mV_uPOvDCQJ52MSlfUO41dh5ZkFlCZOt1nA1asthY59H_svVoNmNbTmADBoFSAGKO1kOQ-9oxNFNS6g3ZjKrR74P0GLwFb7PKFWrZIEAzldersQyJUde7PMU6w'})
