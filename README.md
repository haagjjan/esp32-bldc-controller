# ESP32-S3 BLDC Motor Controller

[![Documents](https://github.com/haagjjan/esp32-bldc-controller/actions/workflows/docs.yml/badge.svg)](https://github.com/haagjjan/esp32-bldc-controller/actions/workflows/docs.yml)

Computer Architecture project, University of Basel, Fall Semester 2026.

We aim to design, assemble, and program a custom ESP32-S3-WROOM-based PCB for precise closed-loop angular positioning of a brushless DC (BLDC) motor. Rotor-position feedback and field-oriented control (FOC) are the intended control approach. We will evaluate positioning error, repeatability, stability, and response to commanded position changes.

The provisional target is at most **1 degree steady-state absolute angular error under no external load**, subject to motor and sensor selection. This is a planning target, not a measured result. If commissioning the custom PCB proves unsuccessful, we plan to use off-the-shelf controller boards with external motor-driving and sensing components.

## Current status

Proposal and collaboration workspace prepared. Component selection, PCB design, firmware tooling, and measurement procedures remain to be decided. No working controller or experimental results are claimed yet.

## System overview

```text
Target angle -> ESP32-S3 control firmware -> motor driver / power stage -> BLDC motor
                         ^                                                |
                         +---------------- position sensor <--------------+
```

## Project files

| Folder | Contents |
| --- | --- |
| [docs](docs) | Proposal, report, figures, and project decisions |
| [hardware](hardware) | Schematics, PCB layout, BOM, and manufacturing exports |
| [firmware](firmware) | Embedded control code and toolchain instructions |
| [experiments](experiments) | Test procedures, raw measurements, and analysis |

**Documents:** [Proposal PDF](docs/proposal/main.pdf) · [Proposal source](docs/proposal/main.tex) · [Report PDF](docs/report/main.pdf) · [Report source](docs/report/main.tex) · [Decision notes](docs/notes.md).

PDFs update automatically after document changes reach `main`. Check the Documents badge above before downloading: a failed or running build means the checked-in PDF may predate the latest source. Pull requests provide preview PDFs under **Actions → run → Artifacts → document-pdfs**.

## Team

Members listed in the proposal: Jan Haag, Hermes Reisner, Dominick (surname pending), and Noel (surname pending).

Repository owner: [haagjjan](https://github.com/haagjjan). Collaborator invitations: [nfa04](https://github.com/nfa04) and [HerRei](https://github.com/HerRei). The third teammate's username and the account-to-name mappings remain to be confirmed.

## Getting started

```sh
git clone https://github.com/haagjjan/esp32-bldc-controller.git
cd esp32-bldc-controller
```

Read [CONTRIBUTING.md](CONTRIBUTING.md) for browser editing, branches, pull requests, and optional local LaTeX builds. Use [Issues](https://github.com/haagjjan/esp32-bldc-controller/issues) to assign work and discuss decisions.

Repository contents and history are public. Only upload material the team may share publicly; keep credentials, private contact details, and course handouts outside the repository. No project license has been selected yet.
