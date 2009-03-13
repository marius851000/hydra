package Hydra::Schema::Projects;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("Projects");
__PACKAGE__->add_columns(
  "name",
  { data_type => "text", is_nullable => 0, size => undef },
  "displayname",
  { data_type => "text", is_nullable => 0, size => undef },
  "description",
  { data_type => "text", is_nullable => 0, size => undef },
  "enabled",
  { data_type => "integer", is_nullable => 0, size => undef },
  "owner",
  { data_type => "text", is_nullable => 0, size => undef },
  "homepage",
  { data_type => "text", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("name");
__PACKAGE__->has_many(
  "builds",
  "Hydra::Schema::Builds",
  { "foreign.project" => "self.name" },
);
__PACKAGE__->belongs_to("owner", "Hydra::Schema::Users", { username => "owner" });
__PACKAGE__->has_many(
  "jobsets",
  "Hydra::Schema::Jobsets",
  { "foreign.project" => "self.name" },
);
__PACKAGE__->has_many(
  "jobs",
  "Hydra::Schema::Jobs",
  { "foreign.project" => "self.name" },
);
__PACKAGE__->has_many(
  "releasesets",
  "Hydra::Schema::ReleaseSets",
  { "foreign.project" => "self.name" },
);
__PACKAGE__->has_many(
  "releasesetjobs",
  "Hydra::Schema::ReleaseSetJobs",
  { "foreign.project" => "self.name" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-03-13 13:33:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:z+RXYaHk0RXJfFirBe175A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
