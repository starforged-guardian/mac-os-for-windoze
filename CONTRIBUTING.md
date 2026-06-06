# Contributing

Thanks for helping Windows users feel less lost on a new Mac.

## Contribution Guidelines

- Optimize for practical onboarding, not trivia.
- Prefer reversible advice and explain tradeoffs.
- Keep scripts confirm-only unless a maintainer explicitly accepts a different safety model.
- Include license, cost, and privacy notes for recommended tools.
- Use official sources when documenting Apple, Homebrew, or third-party app behavior.
- Avoid platform snark. The audience is switching systems, not joining a feud.

## Local Checks

```bash
find scripts -name '*.sh' -print0 | xargs -0 -n1 bash -n
./scripts/validate-links.sh
./scripts/onboard.sh --dry-run --profile all
./scripts/macos-defaults.sh --dry-run
```

If ShellCheck is installed:

```bash
shellcheck scripts/*.sh scripts/lib/*.sh
```

## Updating Recommendations

When adding or changing app recommendations, check the current vendor page and Homebrew cask page. Update [docs/tools.md](docs/tools.md) with:

- What problem the tool solves for a Windows switcher.
- Install command, if available.
- License and cost notes.
- Privacy or macOS permission notes.
