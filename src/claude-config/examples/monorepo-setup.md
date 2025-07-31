# Monorepo Usage Guide

qino-claude works the same in monorepos as anywhere else!

## Usage

```bash
# Single app in monorepo
cd apps/my-new-app
/core:project-init my-concept.md
# → Creates /myapp:build, /myapp:start, etc.

# Multiple apps at once  
/core:project-init auth.md dashboard.md orders.md
# → Creates /auth:build, /dashboard:build, /orders:build

# Same command, same structure, always namespaced
```

Always creates the same structure:

```
.claude/
├── concepts/
│   ├── auth-guide.md          # One guide per concept
│   └── dashboard-guide.md
├── commands/
│   ├── auth/                  # One namespace per concept
│   │   ├── start.md
│   │   ├── build.md
│   │   └── ...
│   └── dashboard/
│       └── ...
└── init-log.md
```

## Examples

```bash
# E-commerce monorepo
/core:project-init storefront.md admin.md orders.md payment.md
# → /storefront:build, /admin:build, /orders:build, /payment:build

# SaaS platform
/core:project-init dashboard.md api.md analytics.md
# → /dashboard:build, /api:build, /analytics:build
```

That's it! No special configuration needed - qino-claude adapts automatically.