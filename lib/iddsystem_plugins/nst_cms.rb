module IddsystemPlugins
  class NstCms
    def self.request_data(opts = {})
      response    = {}

      begin
        url       = URI("http://#{IddsystemPlugins.local_ip}:#{opts[:port]}#{opts[:url]}")
        req       = Net::HTTP::Post.new(url)
        req.set_form_data(:token => opts[:token], :opts => opts.to_json)

        restfull  = Net::HTTP.start(url.host, url.port, :read_timeout => 600) do |http|
          http.request(req)
        end

        if restfull.code.eql? "200"
          result  = JSON.parse(restfull.body)
          response[:msg]      = result['msg']
          response[:data]     = result['data']
          response[:status]   = result['status']
        else
          response[:msg]      = restfull.message
          response[:data]     = ''
          response[:status]   = 'fails'
        end
      rescue Exception => e
        response[:msg]      = e.message
        response[:data]     = e.backtrace
        response[:status]   = 'fails'
      end

      response
    end
  end
end