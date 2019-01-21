# README - Roundtable Project Management

## Description

Roundtable is a democractic project management application. Project Managers are authorized to create employee profiles, new projects, and new tasks. Once those tasks are established, employees are free to claim any unassigned task and see them through to completion.

## Set Up

Fork and clone this repo from Github. Run bundler to install all gem dependencies. Migrate the database via Rake and run rails server and you'll be up and running.

## Initial Sign Up

Sign up will allow the user to create an organization, followed by their user profile. This initial user will be given project lead authorization, allowing them to continue to add employees and projects. Regular employees are not permitted to create their own profiles. They must be given login credentials from a project lead, but can edit those after they sign in.
