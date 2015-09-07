[![Build Status](https://travis-ci.org/pcboy/rtatoeba.svg)](https://travis-ci.org/pcboy/rtatoeba)
[![Gem Version](https://badge.fury.io/rb/rtatoeba.svg)](http://badge.fury.io/rb/rtatoeba)
# Rtatoeba

Rtatoeba is a tiny gem to access tatoeba.org which doesn't have an API yet.

## Installation

Add this line to your application's Gemfile:

    gem 'rtatoeba'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rtatoeba

## Usage

    tatoe = Rtatoeba::Rtatoeba.new(from: 'eng', to: 'kor', query: 'hello')
    tatoe.sentences # =>
    {
        "Hello, I have a reservation, my name is Kaori Yoshikawa. Here is the confirmation card." => [
            [0] "안녕하세요,예약을 했는데요, 제이름은 카오리 요시카와 입니다. 확인카드는 여기있습니다."
        ],
                                                                                    "Hello, Tom." => [
            [0] "안녕, 톰."
        ],
                                                                             "Hello, I am Nancy." => [
            [0] "안녕하세요. 난시입니다.",
            [1] "안녕하세요, 저는 낸시예요."
        ],
                                                                                         "Hello!" => [
            [0] "안녕하세요.",
            [1] "여보세요."
        ],
                                                                         "Hello, it's me, Nancy!" => [
            [0] "안녕하세요. 난시입니다."
        ],
                                                                                   "Hello world!" => [
            [0] "안녕하세요세계"
        ]
    }


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
