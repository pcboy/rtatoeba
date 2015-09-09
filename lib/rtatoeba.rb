# -*- encoding : utf-8 -*-
#
#          DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                  Version 2, December 2004
#
#  Copyright (C) 2004 Sam Hocevar
#  14 rue de Plaisance, 75014 Paris, France
#  Everyone is permitted to copy and distribute verbatim or modified
#  copies of this license document, and changing it is allowed as long
#  as the name is changed.
#  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#
#
#  David Hagege <david.hagege@gmail.com>
#

require "rtatoeba/version"
require 'mechanize'

module Rtatoeba
  class Rtatoeba
    class InvalidLangFormat < ArgumentError; end;

    def initialize(params={})
      @from = params[:from] || "eng"
      @to = params[:to] || "eng"
      @query = params[:query]

      if !accepted_langs.keys.include?(params[:from]) ||
          !accepted_langs.keys.include?(params[:to])
        raise InvalidLangFormat,
          "Invalid chosen language (#{params[:from]} / #{params[:to]}).\n" +
          "Accepted langs are:\n" + accepted_langs.to_s
      end
      @agent = Mechanize.new
    end

    def sentences
      content =
        @agent.get("http://tatoeba.org/eng/sentences/search?query=#{@query}&from=#{@from}&to=#{@to}")
      sentences = {}
      content.search('.sentences_set').map do |set|
        translations = set.search('.sentenceContent').map{|x| x.text.strip}.drop(1)
        sentences[set.at('.mainSentence').text.strip] = translations
      end
      sentences
    end

    private
    def accepted_langs
      {
        "abk" => "Abkhaz",
        "afr" => "Afrikaans",
        "ain" => "Ainu",
        "sqi" => "Albanian",
        "arq" => "Algerian Arabic",
        "amh" => "Amharic",
        "grc" => "Ancient Greek",
        "ara" => "Arabic",
        "hye" => "Armenian",
        "ast" => "Asturian",
        "awa" => "Awadhi",
        "aze" => "Azerbaijani",
        "bak" => "Bashkir",
        "eus" => "Basque",
        "bel" => "Belarusian",
        "ben" => "Bengali",
        "ber" => "Berber",
        "bho" => "Bhojpuri",
        "bos" => "Bosnian",
        "bre" => "Breton",
        "bul" => "Bulgarian",
        "yue" => "Cantonese",
        "cat" => "Catalan",
        "cha" => "Chamorro",
        "cbk" => "Chavacano",
        "chr" => "Cherokee",
        "cmn" => "Chinese (Mandarin)",
        "nya" => "Chinyanja",
        "ckt" => "Chukchi",
        "chv" => "Chuvash",
        "cor" => "Cornish",
        "crh" => "Crimean Tatar",
        "hrv" => "Croatian",
        "cycl" => "CycL",
        "ces" => "Czech",
        "dan" => "Danish",
        "nld" => "Dutch",
        "arz" => "Egyptian Arabic",
        "egl" => "Emilian",
        "eng" => "English",
        "epo" => "Esperanto",
        "est" => "Estonian",
        "ewe" => "Ewe",
        "fao" => "Faroese",
        "fin" => "Finnish",
        "fra" => "French",
        "fry" => "Frisian",
        "glg" => "Galician",
        "kat" => "Georgian",
        "deu" => "German",
        "ell" => "Greek",
        "kal" => "Greenlandic",
        "grn" => "Guarani",
        "guj" => "Gujarati",
        "hat" => "Haitian Creole",
        "hau" => "Hausa",
        "haw" => "Hawaiian",
        "heb" => "Hebrew",
        "hil" => "Hiligaynon",
        "mrj" => "Hill Mari",
        "hin" => "Hindi",
        "hun" => "Hungarian",
        "isl" => "Icelandic",
        "ido" => "Ido",
        "ind" => "Indonesian",
        "ina" => "Interlingua",
        "ile" => "Interlingue",
        "acm" => "Iraqi Arabic",
        "gle" => "Irish",
        "ita" => "Italian",
        "jpn" => "Japanese",
        "jav" => "Javanese",
        "jdt" => "Juhuri (Judeo-Tat)",
        "xal" => "Kalmyk",
        "kaz" => "Kazakh",
        "kha" => "Khasi",
        "khm" => "Khmer",
        "kin" => "Kinyarwanda",
        "tlh" => "Klingon",
        "ksh" => "Kölsch",
        "kor" => "Korean",
        "avk" => "Kotava",
        "kum" => "Kumyk",
        "kur" => "Kurdish",
        "kir" => "Kyrgyz",
        "lld" => "Ladin",
        "lad" => "Ladino",
        "lkt" => "Lakota",
        "lao" => "Lao",
        "lat" => "Latin",
        "lvs" => "Latvian",
        "lzh" => "Literary Chinese",
        "lit" => "Lithuanian",
        "liv" => "Livonian",
        "jbo" => "Lojban",
        "nds" => "Low Saxon",
        "dsb" => "Lower Sorbian",
        "ltz" => "Luxembourgish",
        "mkd" => "Macedonian",
        "mlg" => "Malagasy",
        "zsm" => "Malay",
        "mal" => "Malayalam",
        "mlt" => "Maltese",
        "mgm" => "Mambae",
        "mri" => "Maori",
        "mar" => "Marathi",
        "mhr" => "Meadow Mari",
        "enm" => "Middle English",
        "frm" => "Middle French",
        "nan" => "Min Nan Chinese",
        "mnw" => "Mon",
        "mon" => "Mongolian",
        "nah" => "Nahuatl",
        "nav" => "Navajo",
        "npi" => "Nepali",
        "nog" => "Nogai",
        "nob" => "Norwegian (Bokmål)",
        "non" => "Norwegian (Nynorsk)",
        "nov" => "Novial",
        "oci" => "Occitan",
        "orv" => "Old East Slavic",
        "ang" => "Old English",
        "prg" => "Old Prussian",
        "tpw" => "Old Tupi",
        "oss" => "Ossetian",
        "ota" => "Ottoman Turkish",
        "pdc" => "Pennsylvania German",
        "pes" => "Persian",
        "pcd" => "Picard",
        "pms" => "Piedmontese",
        "ppl" => "Pipil",
        "pol" => "Polish",
        "por" => "Portuguese",
        "pan" => "Punjabi (Eastern)",
        "pnb" => "Punjabi (Western)",
        "que" => "Quechua",
        "qya" => "Quenya",
        "ron" => "Romanian",
        "roh" => "Romansh",
        "rus" => "Russian",
        "san" => "Sanskrit",
        "gla" => "Scottish Gaelic",
        "srp" => "Serbian",
        "wuu" => "Shanghainese",
        "sna" => "Shona",
        "shs" => "Shuswap",
        "scn" => "Sicilian",
        "sjn" => "Sindarin",
        "sin" => "Sinhala",
        "slk" => "Slovak",
        "slv" => "Slovenian",
        "som" => "Somali",
        "spa" => "Spanish",
        "swh" => "Swahili",
        "swe" => "Swedish",
        "tgl" => "Tagalog",
        "tgk" => "Tajik",
        "tam" => "Tamil",
        "tat" => "Tatar",
        "tel" => "Telugu",
        "tet" => "Tetun",
        "tha" => "Thai",
        "bod" => "Tibetan",
        "tpi" => "Tok Pisin",
        "toki" => "Toki Pona",
        "tur" => "Turkish",
        "tuk" => "Turkmen",
        "udm" => "Udmurt",
        "ukr" => "Ukrainian",
        "hsb" => "Upper Sorbian",
        "urd" => "Urdu",
        "uig" => "Uyghur",
        "uzb" => "Uzbek",
        "vie" => "Vietnamese",
        "vol" => "Volapük",
        "wln" => "Walloon",
        "cym" => "Welsh",
        "xho" => "Xhosa",
        "sah" => "Yakut",
        "yid" => "Yiddish",
        "yor" => "Yoruba",
        "zza" => "Zaza",
        "zul" => "Zulu"
      }

    end
  end
end
