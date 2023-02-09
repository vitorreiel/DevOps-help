[ Criando Access Key e Secret Key na AWS ]

   - Vá para IAM > Painel > Usuários
      - Clique em 'Adicionar Usuário'
         - nome: nome de sua preferência
         - Anexar políticas diretamente: AdministratorAccess
	 - Criar Usuário	 
	    - Salve em um local seguro:
               - Access Key
               - Secret Key

[ Criando Registros na Azure  ]

   - Vá para a barra de pesquisa e digite 'Azure Active Directory'
   - Registros de aplicativo > Novo registro
      - Nome: nome de sua preferência
      - Primeira opção marcada
      - Registrar
         - Salve em um local seguro:
            - ID do aplicativo (client_id)
            - ID do diretório (tenant_id)
      - Ainda nessa tela, procure 'Adicionar um certificado ou segredo'
         - Clique em Novo segredo do cliente
            - Descrição: De sua preferência
            - Expira em: Sua preferência
            - Adicionar
               - Salve em um local seguro:
                  - Valor (client_secret)
   - Vá para a barra de pesquisa e digite 'Assinaturas'
      - Clique na sua assinatura
         - Salve em um local seguro:
            - ID da Assinatura (subscription_id)
       - Clique em 'IAM (Controle de acesso)
         - Permitir acesso a este recurso > Adicionar atribuição de função
            - Selecione 'Contribuidor' e em Próximo
               - Membros: Pesquise e selecione pelo nome do aplicativo criado anteriormente
               - Examinar + atribuir
               - Examinar + atribuir novamente
