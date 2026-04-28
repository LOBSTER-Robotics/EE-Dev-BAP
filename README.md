# EE-Dev-BAP
Bachelor Graduation Project 2026 - Data Aqusition System for Underwater Communication

# Project Branching Strategy

This repository follows a structured branching model designed to keep hardware, software, and miscellaneous work isolated, organized, and scalable.

## Core Principle

The `main` (or `master`) branch is **protected and never modified directly**. It serves as the stable, top-level reference for the entire project.

All active development happens in subsystem-specific branches.

## Top-Level Branches

The repository is divided into four primary branches:

- `hardware/`
- `software/`
- `vhdl/`
- `misc/`

Each of these represents an independent subsystem of the project.

## Subsystem Branch Structure

Every subsystem branch follows the same internal structure:

- `<subsystem>/main` — stable version of that subsystem (equivalent to a local "master")
- `<subsystem>/development` — integration branch for ongoing development
- `<subsystem>/feature/*` — feature‑specific branches

### Example (VHDL)

- `vhdl/main`
- `vhdl/development`
- `vhdl/feature/uart-module`
- `vhdl/feature/sdram-controller`

## Development Workflow

1. New work starts in a feature branch:
   - Branch from `<subsystem>/development`

2. Feature development:
   - Work is done in `<subsystem>/feature/*`

3. Integration:
   - Feature branches are merged into `<subsystem>/development`

4. Stabilization:
   - Once stable, `development` is merged into `<subsystem>/main`

5. System‑wide integration (optional/manual):
   - Changes from subsystem `main` branches may be selectively reflected in the global `main` branch if needed

## Important Rules

- Do not commit directly to `main`
- Do not mix hardware, software, vhdl, and misc changes in the same branch
- Keep feature branches focused and short‑lived
- Use pull requests for all merges
- Each subsystem evolves independently through its own branching lifecycle

## Why This Model?

This structure allows:

- Parallel development across domains
- Clear separation of concerns
- Reduced merge conflicts
- Independent release cycles per subsystem
