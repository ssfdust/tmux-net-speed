get_mailcount() {
    echo $(notmuch count --output=messages "tag:unread")
}
get_mailcount
