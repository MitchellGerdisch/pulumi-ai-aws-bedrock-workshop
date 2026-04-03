#!/usr/bin/env bash
# Devcontainer startup banner — prints tool versions and auth status.

# ── Colors ──────────────────────────────────────────────────────────────
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

CHECK="${GREEN}✔${RESET}"
CROSS="${RED}✘${RESET}"

# ── Helpers ─────────────────────────────────────────────────────────────
tool_version() {
  local cmd="$1" flag="${2:---version}"
  if command -v "$cmd" &>/dev/null; then
    local ver
    ver=$("$cmd" "$flag" 2>/dev/null | head -1)
    printf "  ${CHECK}  %-18s %s\n" "$cmd" "$ver"
  else
    printf "  ${CROSS}  %-18s ${DIM}not found${RESET}\n" "$cmd"
  fi
}

# ── Banner ──────────────────────────────────────────────────────────────
echo ""
printf "${BOLD}${CYAN}"
cat << 'BANNER'
  ╔══════════════════════════════════════════════════════════════╗
  ║     AI Agents on AWS — Pulumi & Bedrock AgentCore Workshop  ║
  ╚══════════════════════════════════════════════════════════════╝
BANNER
printf "${RESET}"

# ── Runtimes ────────────────────────────────────────────────────────────
echo ""
printf "${BOLD}  Runtimes${RESET}\n"
printf "  ────────────────────────────────────────────────────────────\n"
tool_version node
tool_version python3
tool_version pulumi
tool_version gh

# ── Coding Agent ────────────────────────────────────────────────────────
echo ""
printf "${BOLD}  Coding Agent${RESET}\n"
printf "  ────────────────────────────────────────────────────────────\n"
tool_version opencode

# ── Getting Started ─────────────────────────────────────────────────────
echo ""
printf "${BOLD}  Getting Started${RESET}\n"
printf "  ────────────────────────────────────────────────────────────\n"

echo ""
printf "  ${BOLD}${CYAN}OpenCode${RESET}\n"
printf "    ${DIM}•${RESET} opencode auth login                       ${DIM}(interactive provider setup)${RESET}\n"
printf "    ${DIM}•${RESET} Or set ${YELLOW}ANTHROPIC_API_KEY${RESET} / ${YELLOW}OPENAI_API_KEY${RESET}  ${DIM}(env var auth)${RESET}\n"
printf "    ${DIM}•${RESET} opencode auth list                        ${DIM}(check configured providers)${RESET}\n"

echo ""
printf "  ${BOLD}${CYAN}Workshop${RESET}\n"
printf "    ${DIM}•${RESET} pulumi login                              ${DIM}(authenticate with Pulumi Cloud)${RESET}\n"
printf "    ${DIM}•${RESET} pulumi env open aws-bedrock-workshop/dev  ${DIM}(verify AWS credentials)${RESET}\n"
printf "    ${DIM}•${RESET} Start with Module 0: 00-setup-and-orientation.md\n"

echo ""
printf "  ────────────────────────────────────────────────────────────\n"
printf "  ${DIM}Happy coding!${RESET}\n"
echo ""
