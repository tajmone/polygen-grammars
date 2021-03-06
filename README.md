# Polygen Grammars

A selected collection of Polygen grammars found around the Internet, organized according to language. The repository is structured to be includable as a Git submodule in other projects. A blacklist of grammars which might be in violation of [GitHub Terms of Service] regarding [Acceptable Use Policy] is enforced via a `.gitgnore` exclusions list.

Curated by Tristano Ajmone (__[@tajmone]__).


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="true" lowercase_only_ascii="true" uri_encoding="true" depth="3" -->

- [Introduction](#introduction)
    - [About Polygen](#about-polygen)
    - [About Polygen Grammars](#about-polygen-grammars)
- [Grammars Origins](#grammars-origins)
- [License](#license)
- [Grammars Organization](#grammars-organization)
- [Grammars Info](#grammars-info)
- [Exclusions List](#exclusions-list)
- [Maintainance Scripts](#maintainance-scripts)
    - [Integrity Checker](#integrity-checker)
    - [Grammars List Generator](#grammars-list-generator)

<!-- /MarkdownTOC -->

-----

# Introduction

## About Polygen

From [Debian Manpages]:

> Polygen is a system for creating cursory nonsense according to a grammar definition, that is following custom syntactical and lexical rules.

Polygen is a cross platform command line tool created by Alviso Spanò; it's written in [OCaml] and released under GNU GPL license.

The official Polygen website (in Italian) can be found at:

- [www.polygen.org]

Polygen precopiled binaries (Windows, Linux and MAC OSX), as well as the full source code and a GUI application (Windows only) can be downloaded from:

- http://www.polygen.org/it/download

There is also an official Polygen repo on GitHub:

- https://github.com/alvisespano/Polygen

## About Polygen Grammars

Polygen grammars are Ascii files with the "`.grm`" extension. Polygen will automatically compile a grammar to "`<filename>.grm.o`" when it first uses it.

From Polygen's _HOWTO-grm_ guide:

> A grammar is an ASCII text file providing the definition of the syntactical structure and terms used by the program to build sentences. _Polygen_ is able to interpret a language designed for defining _type-2_ grammars (according to Chomsky classification) consisting in an extension of the _BNF_ (_Backus Naur Form_) — a very simple and common form for the description of the syntax of a language.

The full _HOWTO-grm_ guide ("How to write a Polygen grammar") can be downloaded as a Zip archived html document from LAPO website: 

- http://lapo.it/polygen/polygen-1.0.6-20040705-doc.zip

# Grammars Origins

The Polygen grammars found here were collected from various Internet sources:

- [www.polygen.org]
- [lapo.it/polygen]
- [github.com/eldios/polyDios][polyDios]

The main source of the grammar files of this repository was Polygen's website, where grammars are grouped by category in the sidebar, and each grammar source file can be individually downloaded.

Polygen's mirror website (at [lapo.it][lapo.it/polygen]) contains the full set of grammars for download as a single Zip archive or as individual `*.grm` files.

The secondary source of grammar files was the [polyDios] project on GitHub, which contains most of the grammars found at [www.Polygen.org], plus many others.

This collection of grammars is a treasure box of examples of what can be achieved with Polygen. Polygen's website dates back to around 2002 (if not older), and it has already gone offline once (then was restored); during these years many authors have contributed their grammars (many are really hilarious and well crafted), and loosing them would be quite a pity. So I thought it would be a good idea to organize a Polygen gramamrs archive to preserve the existing grammars and allow further contributions.

More grammars (in Italian) can be found at:

- https://www.facebook.com/groups/35567209510/files/

# License

Most of these grammars files have been freely downloadable from Polygen's website for years. The grammars were therein published by their authors for the sake of sharing them with others. It's therefore safe to assume that these files can be freely redistributed (unless they explicitly state the contrary), as this has been the accepted practice for over two decades.

Nevertheless, I wasn't able to attach a license file to this repository. There is no legal guarantee to these grammars' usage permission beyond the fact that they have been freely shared over the Internet for years, with their authors silent consent. In other words, the basis legitimazing sharing them are good faith and common sense.

# Grammars Organization

The grammar files are organized into folders according to language:

- [`/it/`](./it/) — Italian (__92__)
- [`/en/`](./en/) — English (__35__)
- [`/fr/`](./fr/) — French (__1__)

# Grammars Info

- [`GRAMMARS_LIST.md`][GRAMMARS_LIST.md]

This file contains the filenames and description of all the grammars in this repo, grouped by language. It's auto-generated via the [grammars list generator] script.

# Exclusions List

- [`.gitignore`](./.gitignore)

This folder contains a `.gitignore` file with an exclusion list of grammars which generate contents which is (or might be) in violation of [GitHub Terms of Service] regarding [Acceptable Use Policy] and [Content Restrictions].

> You agree that you will not under any circumstances upload, post, host, or transmit any content that:
> 
> - is unlawful or promotes unlawful activities;
> - __is or contains sexually obscene content;__
> - is libelous, defamatory, or fraudulent;
> - __is discriminatory or abusive toward any individual or group;__
> - contains or installs any active malware or exploits, or uses our platform for exploit delivery (such as part of a command and control system); or
> - infringes on any proprietary right of any party, including patent, trademark, trade secret, copyright, right of publicity, or other rights.

The two point which I've bolded were my main concern in the redaction of the exclusions list. While the purpose of those grammars was generating satyric random phrases, some of the possible textual outcomes might be considred offensive, politically incorrect or discriminating by some users, and would most likely be out of place on a shared platform like GitHub. Most of the excluded grammars are in Italian, a language and culture which has rather lax rules (to say the least) regarding the use of sexually explicit language and stereotypes — often beyond what other cultures and countries consider acceptable.

Since GitHub is a big community built on mutual cooperation and respect, gathering people from different cultural backgrounds and nationalities, I chose to adopt a safe line and avoid publishing any contents that might offend anyone (rightly or wrongly so that it might be).

The reason I chose to create an exclusion list in the form of a `.gitignore` file (instead of just leaving those grammars out of the project), was to introduce a sort of safeguard to prevent users from accidentally adding to the project the blacklisted grammars — especially for grammars written in a language foreign to the user (eg: Italian). A  `.gitignore` blacklist has the added benefit of allowing to store all the grammars in one place, locally, without sharing online the excluded items.

The exclusions list amounts to __48__ grammars. For more details on how and why these grammars where excluded, see the comments in the [`.gitignore`](./.gitignore) file.

# Maintainance Scripts

I'm working on some shell scripts to help maintainance of the grammars.

Current scripts available:

- [`integritycheck.sh`](./integritycheck.sh)
- [`makegrammarslist.sh`](./makegrammarslist.sh)
 
## Integrity Checker

- [`integritycheck.sh`](./integritycheck.sh)

Invokes `polygen -t` on every grammar in this directory tree (subfolders included), reporting broken grammars. Useful when adding multiple grammars at once, to prevent committing borken grammars.

Reuirements:

- polygen

## Grammars List Generator

- [`makegrammarslist.sh`](./makegrammarslist.sh)

Invokes `polygen -info` on every non-gitignored grammar and builds a markdown file ([`GRAMMARS_LIST.md`][GRAMMARS_LIST.md]) with the filename and info description of every grammar.

The script was designed to run on Bash for Windows and it will force `CRLF` line ending on the final output to allow commiting under Windows. To use under Linux and Mac, just fix EOLs to `LF` in the generated file.

Reuirements:

- polygen
- [recode for Windows] (inside `UnxUtils.zip`)
- [eol-converter-cli] (Node.js):


[recode for Windows]: http://unxutils.sourceforge.net/ "Get recode from GNU utilities for Win32"

[eol-converter-cli]: https://www.npmjs.com/package/eol-converter-cli "Visit 'eol-converter-cli' page at NPM"

[www.polygen.org]: http://www.polygen.org/ "Polygen official website"

[lapo.it/polygen]: http://lapo.it/polygen/ "Mirror of Polygen.org at lapo.it"

[polyDios]: https://github.com/eldios/polyDios "Node.js Polygen magical wrapper, by eldios"

[GitHub Terms of Service]: https://help.github.com/articles/github-terms-of-service/ "View GitHub Terms of Service full document"

[Acceptable Use Policy]: https://help.github.com/articles/github-terms-of-service/#c-acceptable-use "View GitHub Terms of Service, Section C on Acceptable Use"

[Content Restrictions]: https://help.github.com/articles/github-terms-of-service/#2-content-restrictions "View GitHub Terms of Service, Section C.2 on Content Restrictions"

[OCaml]: https://en.wikipedia.org/wiki/OCaml "OCaml page at Wikipedia"

[Debian Manpages]: https://manpages.debian.org/stretch/polygen/polygen.1.en.html "POLYGEN(1) at Debian Manpages"

[@tajmone]: https://github.com/tajmone 

[Grammars List Generator]: #grammars-list-generator

[GRAMMARS_LIST.md]: ./GRAMMARS_LIST.md "See the full list and description of all grammars in this repo"