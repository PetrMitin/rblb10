require_relative '../helpers/authomorph_numbers_helper.rb'
require 'nokogiri'

class AuthomorphNumbersController < ApplicationController
  include AuthomorphNumbersHelper
  def input
  end

  def view
    n = params[:n].to_i
    if n <= 0
      @error = 'N должно быть больше 0!'
    end
    @results = ((1..n).select { |i| authomorph_number?(i) }).to_a
    respond_to do |format|
      format.html do
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.root do
            xml.n n.to_s
            xml.error @error
            xml.results do
              @results.each do |result|
                xml.result do
                  xml.value result.to_s
                  xml.square (result**2).to_s
                end
              end
            end
          end
        end
        xml = builder.doc
        xslt = Nokogiri::XSLT(File.read('C://Users/peter/BMSTU/YAIP/LAB/LAB10/app/controllers/transform.xslt'))
        render html:
          xslt.transform(xml).to_s.html_safe
      end
      format.json do
        render json:
          {n: n, results: @results.map {|i| {value: i, square: i**2}}, error: @error}
        end
      format.xml do
        render xml: { n: n, results: @results.map {|i| {value: i, square: i**2}}, error: @error }
      end
    end 
  end
end
