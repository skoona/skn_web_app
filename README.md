# SknWebApp
An exploration into [Dry-RB](http://dry-rb.org), [Rom-DB](http://Rom-DB.org), and [Roda](https://github.com/jeremyevans/roda) tooling for Ruby Business Applications.

In concept, I plan to create a `runtime` for the [SknServices](https://skoona.github.io/SknServices/) content security application.  SknServices provides Admin features which enables this application to be a runtime consumer, and access content from SknServices using the API it provides for that purpose.

I'm looking for an alternative way to build enterprise ruby web applications.  I've tried Rails and salute it for it's Web Interface and Web framework.  However, I've never been comfortable with it's MVC development model for enterprise applications.

I'm finding that most ruby web tools are as opinionated as Rails.  The difference being tools like Roda, as web interface, allow you to override its conventions through configuration; the reversal is not lost on me!

For now I will keep notes and comments here, until I get to a workable baseline.  *Baseline is now Complete*


### Online Demo
* [SknBase Live!](http://vserv.skoona.net:4000)
* [SknServices Live!](http://vserv.skoona.net:8080)

    *Demo Credentials*
    username: `emtester`,
    password: `demos`


## Progress
#### Current Status -- Complete
* I decided on the File System Layout and implemented the configuration changes needed to redirect affected component paths for `Rake`, and `Roda`.
* Implemented the full database model using `ROM-RB`.  It contains 12 tables in 5 groupings.
* Switched from SknRegistry to Dry-Container, SknConfigurable to Dry-Configurable. Also, using Dry-Types and Dry-Structs.  The remaining Dry-Rb gems had issues or side-effects I did not want to deal with at this time; an example being Dry-AutoInject not support the Class.call() model, only Class.new and some aspects of AutoLoad scattered around in several gems IMHO are just wrong headed.  
* The package is composed of two main application elements; `SknApp`, the console baseline and business logic; and `SknWeb` the web interface code.  The bridge between the two is handled by Dry-Container and a custom class `ServiceRegistry`.
* `SknBase` was the first implementation of this `SknServices Client`.  `SknWebApp` is a refactoring of `SknBase`, using the things I learned from writing tools to address this new frontier; i.e. Ruby Applications with a Web Interface.


## In Summary
It appears that I've written my own version of NestedStruct(Dry-Struct), Configurable(Dry-Configurable), Configuration(SknSettings), Container(Dry-Container lite), Success, and Failure(Dry-Monads lite) in SknUtils.  Writing my own version of a Dry-Types, to bring type safety to the app, is impractical.  So Dry-Types and Rom-rb will be permanent additions to my development toolkit. 

#### Common Tools for Ruby Application Development of all kinds
* Value Container with/without Validation
    * NestedResult, DottedHash, Dry-Struct/Types/Validation
    * Used to create Command Classes and hold intermediate values bundles
* Dependency Management Container
    * SknRegistry, SknSettings, Dry-Container
    * Can also serve as a humanized list of service modules
* Application Settings
    * SknSetting, SknUtils::Configuration, SknUtils::Configurable, Dry-Configurable
    * `./config/settings.yml` externalized settings AND MyApp.root like capabilities. 
* Standard Success/Failure classes
    * Skn's contain :success, :message, :value, and :payload
    * SknSuccess, SknFailure, Dry-Monads Success/Failure(nil side-effects)
* Time Calcs: TimeMath2
* Design Methodology
    * Domain Driven Design
    * Test Driven Design
* Best Practices: SOLID
    * MyClass.call() structure
    * Where:
    ```ruby
      class SomeService
        def self.call(structured_input_command_or_vetted_hash, dependencies={})
          new(dependencies).call(structured_input_command_or_vetted_hash)      
        end
        def initialize(options={})
          @_service_helper = options.fetch(:some_service, DI.resolve('some_service'))
        end
        def call(input)
          ... # do work by calling private methods
        end
        ...
      end
    ``` 


#### Branch: JRuby-Master, JRuby-9.1.15.0 with Warble configuration to produce Tomcat Warfile
#### Branch: master, Ruby-2.5.1

Before engaging the advanced `Dry-RB` gems and other `Gems of Interest`.  I thought to code the basic app with minimal assistance from add-ins.  The overall structure of Roda is very flexible, so other than the normal scss/js struggle there were no surprises in the web-component portion; and more importantly, no imposition on business logic structure.

User information is the only database requirement I have right now.  `Rom-DB` handled the immediate task well enough, and the additional effort needed to add database migration with associated rakes tasks was not too bad.  `Sequel` offered a `dump current schema` command which made defining migration easier.  I was using a PGSQL Dump backup of the Users table and Database from the existing demo application: `SknServices`.  As a result, `Rom-DB` is overkill for this task, `Sequel` would be the correct level technology, if I have no further needs for Database services.  But I have an interest large database models, for which a sample is included, that would require Rom-DB so it stays.

`SknService` also offers a ContentAPI which I am using on the `Resources` page.

Instead of using an advanced container and DI gem, I've started out using my [SknUtils](https://skoona.github.io/skn_utils/) gem; since I was already using it for application settings.  This gem is a thread-safe wrapper over Ruby's Hash, with dot-notation, presence(?) testing, and nested deep-merge capabilities.  Since a hash can use any object/value as it's Key or Value variables, it works well as a global container for environment based application settings, caching, central/critical application-class instances.  Whoever, I did write a `SknRegistry` to more directly handle `DI` requirements and included it in the `SknUtils` gem.

I have adopted the Command and CommandHandler pattern to service all requests for data/info from web pages. Commands encapsulate the request params, in a validate-able command class, as input to the command handler which will invoke the related service.

To link the the Roda Routes to the appropriate services, I've created a `ServicesRegistry` and HTTP/SendFile wrappers/helpers to make the link between the Application Classes and the Web Interface.  The basically moves the lines of code that would have been in the Routes into the ServicesRegistry; which I can mock out as needed for testing later.

Aside from DB migrations and increasing RSPec test coverage, I'm done with this example and very impressed with its structure.


### Gems of Interest
* [SknServices](https://skoona.github.io/SknServices/)
* [SknUtils](https://skoona.github.io/skn_utils/)
* [Roda-i18n](https://github.com/kematzy/roda-i18n)
* [Dry-Types](https://dry-rb.org/gems/dry-types/)
* [Dry-Container](https://dry-rb.org/gems/dry-container/)
* [Dry-Configurable](https://dry-rb.org/gems/dry-configurable/)
* [Dry-Struct](https://dry-rb.org/gems/dry-struct/)
* [Dry-Validation](https://dry-rb.org/gems/dry-validation/)
* [TimeMath2](https://github.com/zverok/time_math2)
* [Roda-Tags](https://github.com/kematzy/roda-tags)
* [FriendlyNumbers](https://github.com/adam12/friendly_numbers)
* [Roda-Parse-Request](https://github.com/3scale/roda-parse-request)
* [Roda-Action](https://github.com/AMHOL/roda-action)
* [Roda-Container](https://github.com/AMHOL/roda-container)
* [Roda-Flow](https://github.com/AMHOL/roda-flow)
* [Ruby-Event-Store](https://github.com/RailsEventStore/rails_event_store)
* [Piperator](https://github.com/lautis/piperator)


### Under Consideration
1. What directory structure is required, and what options are there to override those requirements?
    * Seems Roda and Dry-RB both impose a filesystem structure.
    * Would a Ruby Gem filesystem model be suitable?
    * `Answer` is: See File Tree section.
2. How does activities per-request factor into things like singletons, or Object lifecycle?
    * No Impact
3. Ruby $LoadPath vs Bundler vs Application Source AutoLoad seem to be at odds, in some ways.
    * Autoload is of little interest at this scale. Each Dir has a same-named rbfile that requires all its components
    * Bundler.setup and Bundler.require handle loading all gem for now.
4. While the notion of (Roda) Sub-Apps is valid for large applications, it also serves to segment application source into domains.
    * A sub-app filesystem structure is relevant for the web interface, it becomes clumsy for Domains.
    * For now, I will use one single web app with multiple routes to handle the web interface segmentation.
5. Several plugin automatically require and instantiate other plugins on their own.  Each plugin has to be reviewed to understand its side effects or dependencies.
    * This is a pain to be experienced one time.  Middleware and Plugin order DOES MATTER.
6. Require vs AutoLoad? `Autoload` would prevent loading the whole app when it's not needed during test or CLI operations.  However, `Require` does allow me to control what's loaded and any dependencies with greater clarity.
    * Don't really care yet!  Using the Ruby Require and Require_Relative methods.
7. Not sure about the lifecycle of critical objects in Roda yet.  How to create something that will survive the request/response cycle; like the database component.
    * Again, DI Container maybe helpful.  I'm current using `SknUtils::Configurable` class as the container, and `SknRegistry` as the DI component.  `ROM-RB` is dragging some type of container, likely based on `Dry-Container` might switch to it after some review; `switched`


### File Tree: Done
```bash
[SknWebApp]
    .
    ├── config.ru               - Rack Initializer
    ├── Gemfile                 - Gem Requirements
    ├── assets
    │   ├── stylesheets/        - Sass based CSS
    │   └── javascript/         - JQuery, BootStrap, and general Javascript
    ├── bin
    │   ├── console             - Command line console [app|web] defaults web
    │   └── setup               - One-time installer script
    ├── config
    │   ├── initializers/       - SknApp, SknSettings, and Logging are initialized here
    │   ├── settings/           - SknSettings Environment-biased Application Settings
    │   ├── puma.rb             - Puma local webserver
    │   ├── settings.yml        - Default Application Settings
    │   ├── version.rb          - Application Version Object
    │   ├── environment.rb      - Loads Gems and Initializers Only
    │   ├── boot_web.rb         - Load Main and Web Application components
    │   └── boot.rb             - Load Main Application Only
    ├── db
    │   └── migrate/            - Database migrate scripts
    ├── i18n/                   - Message Translation files
    ├── main                    - Business UseCases and Integrations
    │   ├── authentication/     - User Management
    │   │   ├── user_profile.rb - Main UserProfile Authentication Provider
    │   │   ├── ...             - Warden based security modules
    │   │   └── authentication.rb  - Require management
    │   ├── persistence/        - ROM-DB DataSource management
    │   │   ├── entity/         - Data collections
    │   │   ├── relations/      - ROM Stuff
    │   │   ├── repositories/   - ROM Stuff
    │   │   └── persistence.rb  - Require management and ROM/Types registrations
    │   ├── services/           - API services and ServicesRegistry
    │   │   ├── commands/       - Handler commands for API content requests
    │   │   ├── handlers/       - IO Handler
    │   │   ├── providers/      - Business Requests
    │   │   ├── services_registry.rb  - Web Interface to Primary Application
    │   │   └── services.rb     - Require management and Service registrations
    │   ├── utils/              - Application Utilities
    │   └── main.rb             - LoadPath Management
    ├── public
    │   ├── images/             - View Images
    │   └── fonts/              - View Fonts
    ├── rakelib/                - Rake Tasks, Database Setup and Migrations
    ├── spec/                   - RSpec Tests
    └── web                     - Primary Web Integration
        ├── security/           - Wardens helper interface modules
        ├── helpers/            - View HTML Helpers
        ├── routes
        │   ├── profiles.rb     - Profile Routes
        │   └── users.rb        - User Routes
        └── views
            ├── layouts/        - Site Layout
            ├── profiles/       - Profile Pages
            ├── sessions/       - Signin Pages
            └── about.html...   - Root Pages

```


## Installation
SknWebApp needs a database of users, which should be a shared copy of the table used by SknServices.  This may not be practical, so a pgsql dump file has been includes in the config directory and the following script will install it.
<dl>
    <dt>Setup Application and Create Database Tables:</dt>
        <dd><code>$ bin/setup</code></dd>
    <dt>Start Server with Puma, Port 8585:</dt>
        <dd><code>$ bundle exec puma config.ru -v</code></dd>
    <dt>Start Server with RackUp, Port 9292:</dt>
        <dd><code>$ rackup</code></dd>
    <dt>Start Console with Pry:</dt>
        <dd><code>$ bin/console</code></dd>
    <dt>Start Console with RackSh:</dt>
        <dd><code>$ bundle exec racksh</code></dd>
</dl>


#### Use Sequel to dump current database in migration format
    $ sequel -d postgres://localhost/SknWebApp_development > 001_start.rb

#### Database Model
Authorization (Profiles) and Authentication (Roles)
![Full Data Model](https://github.com/skoona/skn_web_app/blob/master/spec/factories/notes/data_model.png)


### Problems Sovled
ActiveRecord Serialization for Arrays with YAML format was handled nicely by Dry-Types, since I can't easily change the data model.

```ruby
##
# added to Types:
##
module Types
  include Dry::Types.module

  Email = String.constrained(format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  SerializedArrayRead = Types.Constructor(Types.Array(Types::Strict::String)) { |yaml_str| Psych.load(yaml_str) }
  SerializedArrayWrite = Types.Constructor(Types::Strict::String) { |ary_of_str| Psych.dump(ary_of_str) }
end

##
# Entities
##

  class User < ROM::Struct

    def pak
      person_authenticated_key
    end
  end


##
# ROM
##

  class Users < ROM::Relation[:sql]
    schema(:users, infer: false) do

      attribute :id, Types::Serial
      attribute :username, Types::Strict::String
      attribute :name, Types::Strict::String
      attribute :email, ::Types::Email
      attribute :password_digest, Types::Strict::String
      attribute :remember_token, Types::Strict::String.optional
      attribute :password_reset_token, Types::Strict::String.optional
      attribute :password_reset_date, Types::Strict::Time.optional
      attribute :assigned_groups, ::Types::SerializedArrayWrite.meta(desc: :yaml_array), read: ::Types::SerializedArrayRead.meta(desc: :yaml_array)
      attribute :roles, ::Types::SerializedArrayWrite.meta(desc: :yaml_array), read: ::Types::SerializedArrayRead.meta(desc: :yaml_array)
      attribute :active, Types::Strict::Bool
      attribute :file_access_token, Types::Strict::String.optional
      attribute :created_at, Types::Strict::Time
      attribute :updated_at, Types::Strict::Time
      attribute :person_authenticated_key, Types::Strict::String
      attribute :assigned_roles, ::Types::SerializedArrayWrite.meta(desc: :yaml_array), read: ::Types::SerializedArrayRead.meta(desc: :yaml_array)
      attribute :remember_token_digest , Types::Strict::String.optional
      attribute :user_options, ::Types::SerializedArrayWrite.meta(desc: :yaml_array), read: ::Types::SerializedArrayRead.meta(desc: :yaml_array)

      primary_key :id

    end

    auto_struct true

    # Define some composable, reusable query methods to return filtered
    # results from our database table. We'll use them in a moment.
    def by_pk(id)
      where(id: id)
    end
    def by_pak(pak)
      where(person_authenticated_key: pak)
    end
  end

```

## Naming
* Relation Table Names should be plural form
* SQL Table names should be plural
* Relations themselves should be plural and match the real-sql table name
* Entities representing a relation should be singular
* Entities composed of other entities must use relation-name (plural) as the attribute keyname
* Repositories can be named anything since they specify the relation name in their constructor

```ruby
  class Users < ROM::Repository[:users]
    struct_namespace Entity

    def all
      root.to_a
    end

    def query(conditions)
      root.where(conditions).to_a
    end

    def by_pak(pak)
      root.by_pak(pak).one!
    end

    def [](id)
      root.by_id(id).one
    end

    def by_id(id)
      root.by_pk(id).one
    end

    def find_by(col_val_hash)
      root.where(col_val_hash).one
    end
  end
```


### Notes
`puma` or `rackup` commands alone will start the server. But wont read puma's config which means the default port maybe 9292 vs 3000.
`Roda's` RodaApp.freeze.app uses RackBuilder to create an Rack App, which confuses the more deliberate `Rack::Handler::Puma.reun(app)` method.

`racksh` is a console for Rack based applications, see docs at [Gem RackSh](https://github.com/sickill/racksh)
In racksh console: `$ $rack.get "/", {}, { 'REMOTE_ADDR' => '127.0.0.1' }`

`plugin: multi_route` has a very strange structure for associated route files.
```Ruby
# File: ./routes/prefix.rb

class SknWeb
    route('prefix') do
      ...
    end
end
```
It opens and extends the existing app name class.  `SknWeb` is also the name of this apps Web main.  Helper files have the same behavior.

The assets plugin initially failed (HTTP-404) to send bootstrap.css at Roda V3.3.0.  Switched to 2.29.0 and it worked, tried 3.3.0 again and everything seems to work now!  Making this note in case the trouble shows again.
Asset Plugin Failure: Sending bottstrap.css with a 'Content-Type' eq 'text/html' 'Content-Length' eq '3045'; verus 'text/css' and 146K.

The PostgreSQL gem gave me trouble when brew updated to Version 10 of PostgreSQL, this solve the install problem.

```bash
$ bundle config build.pg --with-pg-config=/usr/local/Cellar/postgresql/10.1/bin/pg_config
```


### Code Cache

```html
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
```

```ruby
  # TODO: Experiment with direct file and/or minimized sources
  # plugin :assets, {
  #     css: "bootstrap.css",
  #     js: ["jquery-3.2.1.min.js", "bootstrap.js"]
  # }

  # TODO: Experiment with Gem-Based files
  # plugin :assets, {
  #       css: 'bootstrap.scss.indirect' ,
  #        js: 'bootstrap.js.indirectraw',
  #        dependencies: {
  #            Bootstrap.stylesheets_path + '_bootstrap.scss' => Dir[Bootstrap.stylesheets_path + '/**/*.scss'],
  #        }
  # }

```

```ruby
    File.join(Dir.pwd, "views")
```

#### Discover Warden inside app under Test
```ruby
     manager = app -- = Skn::SknWebApp.app
     manager = manager.instance_variable_get(:@app) while manager.class.name != 'Warden::Manager'

```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
