require "yaml"
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  new_hash = {}
  
  emoticons.each do |emotion, array|
    new_hash["get_meaning"] ||= {}
    new_hash["get_emoticon"] ||= {}
    new_hash["get_meaning"][array.last] ||= emotion
    new_hash["get_emoticon"][array.first] ||= array.last
  end 
  new_hash
end

def get_japanese_emoticon(path, emoticon)
  lib_hash = load_library(path)
  english = emoticon 
  if lib_hash["get_emoticon"][english] != nil   
    lib_hash["get_emoticon"][english]
  else 
    "sorry, that emoticon was not found"
  end 
end

def get_english_meaning(path, emoticon)
  emo_hash = load_library(path)
  japanese = emoticon 
  
  if emo_hash["get_emoticon"][japanese] != nil 
    emo_hash["get_emoticon"][japanese]
  else 
    "Sorry, that emoticon was not found"
  end 
end