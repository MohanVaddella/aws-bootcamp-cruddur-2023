-- this file was manually created
INSERT INTO public.users (display_name, email, handle, cognito_user_id)
VALUES
  -- we can grab the cognito_user_id manually from the Congito Console
  ('Mohan Vaddella','mohanvaddella@gmail.com' , 'mohan' ,'MOCK'),
  ('Shiva Sai','shivasai@gmail.com' , 'shiva' ,'MOCK'),
  ('Ravi Krishna','ravikrishna@gmail.com' , 'ravi' ,'MOCK'),
  ('Lasya Sri', 'lasyasri@gmail.com','lasya','MOCK');
  

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'mohan' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )