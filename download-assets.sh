#!/bin/sh
# Downloads the illustrations, icons and app screenshot exported from your Figma file
# into the assets/ folder.
#
# Run it ONCE, from inside the tasker-site folder, on your own computer:
#     sh download-assets.sh
#
# Safe to run again: files you already have are skipped.
# The links Figma hands out expire after 7 days: the landing-page images stop working on
# 2026-11-17, the download-page images on 2026-11-21. If they have expired, ask Claude
# to re-export and send a fresh script.

cd "$(dirname "$0")" || exit 1
mkdir -p assets
fail=0

get() {
  # $1 = file name, $2 = url
  if [ -s "assets/$1" ]; then
    echo "have     $1"
    return
  fi
  if curl -fsSL --max-time 60 -o "assets/$1" "$2"; then
    echo "ok       $1"
  else
    echo "FAILED   $1"
    rm -f "assets/$1"
    fail=1
  fi
}

get app-preview.png   "https://www.figma.com/api/mcp/asset/32bfe111-0278-4d1f-b136-a392f16fb118.png"
get icon-apple.svg    "https://www.figma.com/api/mcp/asset/e1706ea1-b0d7-4394-a7bd-80a8808e75e9.svg"
get icon-apple-2.svg  "https://www.figma.com/api/mcp/asset/62a182ea-a0df-40f6-8e1c-a5814111da3f.svg"
get icon-chevron.svg  "https://www.figma.com/api/mcp/asset/0c271322-7ef9-4215-8a83-17d99ed9ad09.svg"
get logo-1.svg        "https://www.figma.com/api/mcp/asset/6d628078-de4f-4390-9c7b-214ac008ebd8.svg"
get logo-2.svg        "https://www.figma.com/api/mcp/asset/1d28cef7-dc6a-42d1-8d20-a7322a1581ef.svg"
get logo-3.svg        "https://www.figma.com/api/mcp/asset/29bba9eb-7aac-41cb-af24-995e7e9e693e.svg"
get feat1-chip.svg    "https://www.figma.com/api/mcp/asset/57427293-e30a-4807-b817-5b1058d016b1.svg"
get feat2-bolt.svg    "https://www.figma.com/api/mcp/asset/cda80ab9-9a86-41c2-8767-1a43efcb3b7d.svg"
get feat3-base.svg    "https://www.figma.com/api/mcp/asset/2b057e58-4a3c-4f97-bc7b-d6d89811daf5.svg"
get feat3-a.svg       "https://www.figma.com/api/mcp/asset/686adb9d-00a4-4f7e-9a4b-431b53c404a8.svg"
get feat3-b.svg       "https://www.figma.com/api/mcp/asset/c31fb9ee-9c40-48c0-8980-8460b800a620.svg"
get feat3-c.svg       "https://www.figma.com/api/mcp/asset/d16a3524-9e4d-4f74-b7fa-d4dee62d20d3.svg"
get code-1.svg        "https://www.figma.com/api/mcp/asset/18348b53-cd02-428f-a273-63a2d4926443.svg"
get code-2.svg        "https://www.figma.com/api/mcp/asset/ca6372a0-fd91-4faa-9100-432068c6289d.svg"
get code-3.svg        "https://www.figma.com/api/mcp/asset/9532a911-6fe2-4598-9719-e4259dce465f.svg"
get book-1.svg        "https://www.figma.com/api/mcp/asset/91a32a1d-8a7c-49c4-a048-b1e2b508b350.svg"
get book-2.svg        "https://www.figma.com/api/mcp/asset/9ba80e27-2847-447b-9b7c-a2ca9d05b155.svg"
get book-3.svg        "https://www.figma.com/api/mcp/asset/41f5b5f3-873d-4bcf-9ee7-fb4cffe0e2fe.svg"
get lock-1.svg        "https://www.figma.com/api/mcp/asset/62f0dc92-28ea-4def-b773-1a77b0e49c16.svg"
get lock-2.svg        "https://www.figma.com/api/mcp/asset/5470d980-e829-42f3-b96b-2516f281ab23.svg"
get lock-3.svg        "https://www.figma.com/api/mcp/asset/4cdef149-ca8b-4341-87c8-b25c94321559.svg"
get check-1.svg       "https://www.figma.com/api/mcp/asset/6e1ea55f-a73d-4470-beb5-2f870a174855.svg"
get check-2.svg       "https://www.figma.com/api/mcp/asset/73aacda0-f8f7-4c09-897b-c3d93acf5b8e.svg"
get check-3.svg       "https://www.figma.com/api/mcp/asset/cec58fff-9665-448a-a458-3c7a0633881e.svg"
get dl-arrow.svg      "https://www.figma.com/api/mcp/asset/870c6849-e4ff-4c1c-adde-c7a6c3ec69c1.svg"
get dl-icon.svg       "https://www.figma.com/api/mcp/asset/5ec4e5b6-9a54-434e-b797-ce073783d51d.svg"
get dl-version.svg    "https://www.figma.com/api/mcp/asset/8d4c107f-3576-445f-8831-ae4cb99e0c7a.svg"
get no-ai-stamp.svg   "https://www.figma.com/api/mcp/asset/69c01ad2-1524-40a9-bd2f-2343b02f19ec.svg"

echo
if [ "$fail" -eq 0 ]; then
  echo "All assets downloaded. Open index.html in your browser."
else
  echo "Some downloads failed (see above). The links may have expired."
fi
