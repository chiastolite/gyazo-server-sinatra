class GyazoServer < Sinatra::Base
  post '/upload.cgi' do
    image = params[:imagedata][:tempfile].read
    filename = Digest::MD5.hexdigest(image)
    File.open("./public/#{filename}.png",'wb').print image

    "http://gyazo-server-sinatra.dev/#{filename}.png"
  end
end
