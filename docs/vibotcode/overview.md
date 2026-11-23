# VibotCode Workspace Overview

The workspace contains independent frontend and backend Git repositories. Frontend TeamAI projects represent runtime platforms; backend TeamAI projects represent service repositories.

| TeamAI project | Scope | Architecture | Main verification |
| --- | --- | --- | --- |
| `frontend-pc` | Desktop administration and operations | Repository-defined Web stack | repository lint/test/build plus affected desktop flows |
| `frontend-mobile` | Mobile Web, H5 and WebView | Repository-defined mobile Web stack | repository checks plus real mobile/container flows |
| `frontend-mini-program` | Native or cross-platform mini program | Repository-defined mini-program stack | repository checks plus developer-tool/device flows |
| `center-platform` | Marketing platform foundation | Java 8, Spring Boot MVC | module tests/package and contract checks |
| `center-gateway` | Marketing platform gateway | Java 8, Spring Cloud Gateway/WebFlux | reactive tests/package and route/security checks |
| `center-point` | Point management | Java 8, COLA multi-module | affected-module tests/package and ledger consistency checks |
| `center-vip` | Member growth | Java 8, COLA multi-module | affected-module tests/package and member-state checks |
| `center-manage` | Marketing activity/customer/tag management | Java 8, Spring Boot MVC | module tests/package and orchestration checks |
| `center-mall` | Equity mall service | Java 8, Spring Boot MVC | module tests/package and cache/counter checks |
| `center-chain` | Equity supply channel | Java 8, COLA multi-module | affected-module tests/package and order consistency checks |
| `xxl-job` | Customized scheduler | Java 8, Maven admin/core modules | affected-module package and scheduler compatibility checks |

Workspace-level `vibotcode` is for cross-project governance and documentation work, not a substitute for platform or service context. Verification commands are selected from the current repository; this table is a scope guide, not permission to assume scripts or modules exist.

