resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
games { 'gta5' }

author 'ENoir'
version '1.0.0'

loadscreen 'index.html'
loadscreen_manual_shutdown 'yes'
client_script 'client.lua'

files {
    'index.html',
    'css/style.css',
    'js/*.js',
    'img/background.jpg',
    'img/logo.png',
    'music/music.mp3'
}
