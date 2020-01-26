# Contributing Guidelines

When contributing to this repository, please first discuss the change you wish
to make via an
[issue](https://github.com/TEECOM/slack_sign_in/issues/new)
before making a change.

**Please note:** we have a [code of conduct](./CODE_OF_CONDUCT.md) that you must
follow in all your interactions with the project.

## Writing a feature

Create a local feature branch based on the `production` branch:

```
git checkout production
git pull
git checkout -b <branch-name>
```

When multiple people work on the same project in parallel, your feature branch
can become out of date with the upstream `production`. Rebase frequently to
incorporate upstream changes:

```
git fetch origin
git rebase origin/production
```

Resolve conflicts. Whenever you'd like to receive feedback, stage your changes:

```
git add --all
```

When you've staged the changes, commit them:

```
git status
git commit --verbose
```

Write a [good commit message](https://chris.beams.io/posts/git-commit/). For
example, something like this:

```
Present-tense summary under 50 characters

More detailed explanatory text, if necessary. Wrap it to about 72
characters or so. The blank line separating the summary from the body
is critical (unless you omit the body entirely); tools like rebase
can get confused if you run the two together.

Further paragraphs come after blank lines. And:

  - Bullet points are okay, too

Fixes #10000
```

If the changes are a result of pairing, you'll want to make sure everyone gets
the credit they deserve by 
[including them as a co-author.](https://help.github.com/en/articles/creating-a-commit-with-multiple-authors).

Feel free to share your branch at any point in the development process with:

```
git push -u origin <branch-name>
```

Submit a
[GitHub pull request](https://help.github.com/articles/about-pull-requests/)
and, when you're ready, add the `status:ready for review` label and request a
review from a member of the team.

## Reviewing code

Ideally, a team member other than the original author will review the code.
They make comments and ask questions directly on lines of code in the GitHub web
interface. When they are satisfied with the changes, they will approve the pull
request and add either the `status:ready to squash` or `status:ready to merge`
labels.

Some things to keep in mind...

- Accept that many programming decisions are opinions. Discuss tradeoffs,
  which you prefer, and reach a resolution quickly.

- Ask good questions; don't make demands.
  ("What do you think about naming this `:user_id`?")

- Ask for clarification. ("I didn't understand. Can you clarify?")

- Be humble. ("I'm not sure - let's look it up.")

- Don't use hyperbole. ("always", "never", "endlessly", "nothing")

- Talk synchronously (e.g. chat, screensharing, in person) if there are too
  many "I didn't understand" or "Alternative solution:" comments.
  Post a follow-up comment summarizing the discussion.

As a reviewee...

- Explain why the code exists. ("It's like that because of these reasons. Would
  it be more clear if I rename this class/file/method/variable?")

- Push commits based on earlier rounds of feedback as isolated commits to the
  branch. Do not squash until the branch is ready to merge. Reviewers should
  be able to read individual updates based on their earlier feedback.

- Seek to understand the reviewer's perspective.

- Try to respond to every comment.

As a reviewer...

- Communicate which ideas you feel strongly about and those you don't.

- Identify ways to simplify the code while still solving the problem.

- Offer alternative implementations, but assume the author already considered
  them. ("What do you think about using a custom validator here?")

- Seek to understand the author's perspective.

## Merging

Once a team member has approved your pull request and tests are passing,
you are nearly ready to merge your changes.

If you've created more than one commit,
[use `git rebase` interactively](https://help.github.com/articles/about-git-rebase/)
to squash them into a small number of cohesive commits with good messages:

```
git fetch origin
git rebase -i origin/production
```

Force push your branch. This allows GitHub to automatically close your pull
request and mark it as merged when your commit(s) are pushed to `production`. It
also makes it possible to find the pull request that brought in your changes.

```
git push --force-with-lease origin <branch-name>
```

View a list of new commits. View changed files. Merge branch into `production`.

```
git log origin/production..<branch-name>
git diff --stat origin/production
git checkout production
git merge <branch-name> --ff-only
git push
```

Delete your remote feature branch.

```
git push origin --delete <branch-name>
```

Delete your local feature branch.

```
git branch --delete <branch-name>
```
