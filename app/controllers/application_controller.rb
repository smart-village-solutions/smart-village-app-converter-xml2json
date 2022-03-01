class ApplicationController < ActionController::Base

  def import_poi
    Importer.new(:poi)
  end
end
