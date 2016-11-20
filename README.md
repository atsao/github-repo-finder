# Lab 2 - Github Repo Finder

**Github Repo Finder** is an app using the [Github Search API](https://developer.github.com/v3/search/#search-repositories).

Time spent: **13** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can view a list of repos
- [x] User can search a list of repos
- [x] User can filter by number of stars
- [ ] User can filter by language - *this is incomplete*

The following **optional** features are implemented:

- [ ] Implement search options to match text in repo's name, description, or README
- [ ] Add sorting options based on stars, forks, or relevance
- [ ] Add option to search repos created after a certain date
- [ ] Implement an interface to filter based on any of the [languages available](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml) on Github

The following **additional** features are implemented:

N/A

## Video Walkthrough

Here's a walkthrough of implemented user stories.

![Github Repo Search GIF](./github.gif "Github Repo Search")

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Libraries

- CocoaPods
    - AFNetworking
    - MBProgressHUD

## Notes

Challenges:

- Not able to get filter by languages working

Concepts demonstrated:

- Table view cells automatically resize
- Auto Layout
- Modal settings view

## License

    Copyright 2016 Andrew Tsao

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
