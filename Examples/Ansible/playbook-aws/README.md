Template Ansible para configuração de alguns serviços nas Máquinas da AWS


[ hosts ]

 - Arquivo para identificar o ip das máquinas que serão configuradas;
 - Arquivo onde deve ser identificado a maneira como o Ansible poderá fazer a conexão com as máquinas (ex: SSH);
 - Se utilizar o SSH, identifique uma chave para se autenticar, não coloque senha nem use usuário 'root'.

[ credentials ]

 - Pasta onde deve se localizar a chave, que o Ansible usará para se autenticar nas máquinas;

[ vm1.yaml ]

 - Nesse arquivo de configuração Ansible é feito inicialmente 'Update';
 - E a instalação das seguintes ferramentas: Java, Jenkins.

[ vm2.yaml ]

 - Nesse arquivo de configuração Ansible é feito inicialmente 'Update';
 - E a instalação das seguintes ferramentas: Java, Nginx.

[ vm3.yaml ]

 - Nesse arquivo de configuração Ansible é feito inicialmente 'Update';
 - E a instalação do: Dependências do Docker, Docker, Docker Compose e Containerd.io.
