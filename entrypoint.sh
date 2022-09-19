git remote add target https://${INPUT_TARGET_USERNAME}:${INPUT_TARGET_TOKEN}@${INPUT_TARGET_URL#https://}
git remote add mirror https://${INPUT_TARGET_USERNAME}:${INPUT_TARGET_TOKEN}@${INPUT_TARGET_URL#https://}

case "${GITHUB_EVENT_NAME}" in
    push)
        git push -f --all target
        git push -f --tags target
        git push mirror "master:main"
        ;;
    delete)
        git push -d target ${GITHUB_EVENT_REF}
        ;;
    *)
        break
        ;;
esac