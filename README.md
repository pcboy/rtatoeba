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

    tatoe = Rtatoeba::Rtatoeba.new(from: 'eng', to: 'kor', 'hello')
    tatoe.sentences # =>
    [
        [0] [
            [0] "Hello, I have a reservation, my name is Kaori Yoshikawa. Here is the confirmation card.",
            [1] "안녕하세요,예약을 했는데요, 제이름은 카오리 요시카와 입니다. 확인카드는 여기있습니다."
        ],
        [1] [
            [0] "Hello, Tom.",
            [1] "안녕, 톰."
        ],
        [2] [
            [0] "Hello, I am Nancy.",
            [1] "안녕하세요. 난시입니다."
        ],
        [3] [
            [0] "안녕하세요, 저는 낸시예요.",
            [1] "Hello!"
        ],
        [4] [
            [0] "안녕하세요.",
            [1] "여보세요."
        ],
        [5] [
            [0] "Hello, it's me, Nancy!",
            [1] "안녕하세요. 난시입니다."
        ],
        [6] [
            [0] "Hello world!",
            [1] "안녕하세요세계"
        ]
    ]


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
