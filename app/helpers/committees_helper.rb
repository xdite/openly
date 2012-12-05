# -*- encoding : utf-8 -*-
require 'digest/md5'
module CommitteesHelper
  def render_committee_avatar(committee, size = "small" )
    hash = Digest::MD5.hexdigest("MLY/#{committee.name}")
    link_to committee_path(committee) do
      image_tag("http://avatars.io/50a65bb26e293122b0000073/#{hash}?size=#{size}", :height => 50 )
    end
  end
end
