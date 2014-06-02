# WorkflowStatus

When building a content management system, it's often useful to model the stages a user goes through when working on a bit of content. Much like how a new feature is not immediately ready to be committed to a git repo, a user will often want to start working on a new page or product as 'draft' before she is ready to publish it to the live site. And its also often useful to give users a way to 'trash' certain items without actually deleting the records from the database.

WorkflowStatus provides some convenient methods for modeling such a workflow with an ActiveRecord attribute called, unsurprisingly, 'workflow_status.' Imagine you have a Page model in your app. With workflow_status, you can call:

```
Page.published
Page.first.published?
Page.last.trashed?
Page.unpublished
etc.
```

## Installation

Add this line to your application's Gemfile:

    gem 'workflow_status'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install workflow_status

## Usage

Create a migration to add 'workflow_status' to your model.

```
class AddWorkflowStatusToPage < ActiveRecord::Migration
  def change
    add_column :pages, :workflow_status, :integer, limit: 2, null: false, default: 0  
  end
end
```


Then add WorkflowStatus to your model:

```
class Page < ActiveRecord::Base

  extend WorkflowStatus

  # ...

end
```

And then you can call, eg.:

```
Page.published
Page.first.published?
Page.last.trashed?
Page.unpublished
etc.
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/workflow_status/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
