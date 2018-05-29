include:
{% if pillar.users.users_list is defined %}
- users.users_list
{% endif %}