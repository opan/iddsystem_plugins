module IddsystemPlugins
  class Member
    def self.registration(opts = {})
      response    = {}

      begin
        url       = URI("http://#{IddsystemPlugins.local_ip}:#{PORT_NCO}/nco_ws/main")
        req       = Net::HTTP::Post.new(url)
        req.set_form_data(:token => TOKEN, :opts => opts.to_json)

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
          response[:status]   = restfull.code
        end
      rescue Exception => e
        response[:msg]      = e.message
        response[:data]     = e.backtrace
        response[:status]   = 202
      end

      response
    end

    def self.activation_registration(opts = {})
      response    = {}

      begin
        url       = URI("http://#{IddsystemPlugins.local_ip}:#{PORT_NCO}/nco_ws/main")
        req       = Net::HTTP::Post.new(url)
        req.set_form_data(:token => TOKEN, :opts => opts.to_json)

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
          response[:status]   = restfull.code
        end
      rescue Exception => e
        response[:msg]      = e.message
        response[:data]     = ''
        response[:status]   = 202
      end

      response
    end
  end
end