require 'httparty'
class RedirectController < ApplicationController

  protect_from_forgery except: :google_analytics


  def google_analytics
    respond_to do |format|
      format.js {render file: 'public/analytics.js', status: :success, layout: false}
    end
  end

  def collect
    HTTParty.get 'https://google-analytics.com/collect', query: collect_params, headers: x_forwarded_for_header
    render text: 'ok'
  end

  def r_collect
    HTTParty.get 'https://google-analytics.com/r/collect', query: collect_params, headers: x_forwarded_for_header
    render text: 'ok'
  end

  private
  def collect_params
    params.permit(:v, :_v, :a, :t, :_s, :dl, :ul, :de, :dt, :sd, :sr, :vp, :je, :fl, :_u, :jid, :cid, :tid, :z).to_h
  end

  def x_forwarded_for_header
    {'X-Forwarded-For': request.remote_ip}
  end
end
