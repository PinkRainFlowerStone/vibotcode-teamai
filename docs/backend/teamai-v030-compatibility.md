# TeamAI v0.30.0 Backend Compatibility

This note records the backend resource audit against the released TeamAI CLI
`v0.30.0` (`b594bd7420a829800cb77459e4f13f49b2147d65`, released November 11,
2026). It is a compatibility record, not a requirement to use unreleased
features from the upstream `main` branch.

## Released contract used here

- Skills use `SKILL.md` with `name` and `description` frontmatter.
- Canonical agents use YAML with `name`, `description`, `instructions`, and
  optional `tools`; the backend agents stay in `agents/backend/` and
  `agents/backend-review/`.
- Rules and docs remain Markdown resources in their namespace directories.
- Workflows use `schemaVersion: v1alpha1`, a token `name`, a non-empty
  `description`, typed `inputs`, optional `defaults.inputs`, and a `steps`
  graph with one action per step.
- `invoke` is explicitly declared for all three backend workflows: `ask` for
  development and `allow` for self-check/review. This keeps the start policy
  visible under the v0.30.0 workflow contract. The CLI driver is selected at
  launch (`--driver local` or `--driver skill`); it is not a workflow YAML
  field.
- `workspace: new` is used by the development workflow header. Its changes
  stay on TeamAI's isolated branch and require a human to inspect and merge;
  the implementation verification step, self-check, and review steps declare
  `workspace: read-only`.
- Step outputs use v0.30.0 shorthand types and literal unions. Verification
  outputs record actual commands, result, evidence, checks not run, residual
  risks, and readiness rather than inferring success from a build-only result.

## Backend project boundary

The backend role is intended for the eight selected services:

- `center-platform`, `center-gateway`, `center-point`, `center-vip`,
  `center-manage`, `center-mall`, `center-chain`, and `xxl-job`.

The shared backend resources describe Java 8 and Spring Boot 2.7-compatible
patterns, but do not turn repository-specific architecture into a universal
policy. The project documents remain the source of truth for single-module
services, the WebFlux gateway, COLA-style modules, and the XXL-JOB platform.

## Released versus upstream-main-only

The v0.30.0 audit did not add fields that are only present on upstream `main`.
In particular, these are not used by the backend resources:

- step-level or default `role` routing introduced after the v0.30.0 release;
- `answer_file`, workflow-produced `from` bundles, runtime/fleet selection,
  confined places, and newer requirements/driver protocol fields;
- agent folders using `AGENT.md`, workflow-folder inheritance, or other
  post-release resource-folder behavior.

The released v0.30.0 source accepts the backend files as ordinary YAML/Markdown
resources. A newer CLI may understand more fields, but this team repository
must not depend on those fields until a released version is explicitly
adopted.

## Verification record

The audit checked the three backend workflows for:

1. `schemaVersion`, names, descriptions, inputs, defaults, action uniqueness,
   dependency references, and output shorthand;
2. `invoke`, top-level versus step-level `workspace`, and named agent files;
3. isolated branch semantics for development and read-only behavior for
   self-check/review;
4. structured verification and review evidence contracts.

The official `v0.30.0` source was inspected locally and the team repository
targets that released CLI. No backend business repository is changed by this
audit.
