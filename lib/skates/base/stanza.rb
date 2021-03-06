module Skates
  module Base
    ##
    # Class used to Parse a Stanza on the XMPP stream.
    # You should have a Stanza subsclass for each of your controller actions, as they allow you to define which stanzas and which information is passed to yoru controllers.
    #
    # You can define your own macthing pretty easily with the element and elements methods, as explained in the SaxMachine Documentation: http://github.com/pauldix/sax-machine/tree/master
    # if your stanza is a message stanza, you can match the following for example:
    # element :message, :value => :to, :as => :to 
    # element :message, :value => :from, :as => :from 
    # element :message, :value => :id, :as => :stanza_id 
    # element :message, :value => :type, :as => :stanza_type 
    # element :message, :value => :"xml:lang", :as => :lang 
    #
    class Stanza
      include SAXMachine
      attr_reader :xml
      
      def initialize(xml = nil)
        @xml = xml
        parse(xml.to_xml)
      end
    end
  end
end